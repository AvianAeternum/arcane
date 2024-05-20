import 'dart:async';

import 'package:arcane/arcane.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

typedef ArcaneUserData = Map<String, dynamic>;

class UserService extends StatelessService {
  String? _grabFirstName;
  String? _grabLastName;
  Map<String, dynamic> lastUser = {};
  Map<String, dynamic> lastUserCapabilities = {};
  Map<String, dynamic> lastUserPrivate = {};
  List<VoidCallback> closable = [];
  bool _bound = false;

  Future<void> unbind() async {
    _bound = false;
    for (var e in closable) {
      e();
    }
    closable.clear();
    lastUser = {};
    lastUserCapabilities = {};
    lastUserPrivate = {};
    _grabFirstName = null;
    _grabLastName = null;
  }

  void grabName(String? firstName, String? lastName) {
    _grabFirstName = firstName;
    _grabLastName = lastName;
  }

  bool get bound => _bound;

  Future<void> bind(String uid) async {
    if (_bound) {
      return;
    }

    _bound = true;

    verbose("Binding user service for $uid");
    try {
      await FirebaseAnalytics.instance
          .setUserId(id: uid, callOptions: AnalyticsCallOptions(global: true));
      verbose("Bound Analytics");

      PrecisionStopwatch p = PrecisionStopwatch.start();
      await [
        _ensureUser(uid),
        _ensureUserCapabilities(uid),
        _ensureUserPrivate(uid),
      ].wait();
      verbose("Got all init data in ${p.getMilliseconds()}");
      List<StreamSubscription> subs = [
        Arcane.app.users.userRef(uid).snapshots().listen((event) {
          lastUser = event.data() ?? {};
          Arcane.app.users.onUserUpdate?.call(lastUser);
        }),
        Arcane.app.users.userCapabilitiesRef(uid).snapshots().listen((event) {
          lastUserCapabilities = event.data() ?? {};
          Arcane.app.users.onUserCapabilitiesUpdate?.call(lastUserCapabilities);
        }),
        Arcane.app.users.userPrivateRef(uid).snapshots().listen((event) {
          lastUserPrivate = event.data() ?? {};
          Arcane.app.users.onUserPrivateUpdate?.call(lastUserPrivate);
        })
      ];
      closable.addAll(subs.map((e) => () => e.cancel()));
    } catch (e, es) {
      Arcane.logger.handle(e, es, "Failed to bind User service!");
    }
  }

  String uid() => auth.FirebaseAuth.instance.currentUser!.uid;

  Future<void> _ensureUser(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snap =
        await Arcane.app.users.userRef(uid).get();

    if (!snap.exists) {
      lastUser = Arcane.app.users.onCreateUser(ArcaneUserInfo(
        firstName: _grabFirstName ??
            auth.FirebaseAuth.instance.currentUser!.displayName!
                .split(" ")
                .first,
        lastName: _grabLastName ??
            auth.FirebaseAuth.instance.currentUser!.displayName!
                .split(" ")
                .last,
        email: auth.FirebaseAuth.instance.currentUser!.email!,
        uid: uid,
      ));
      await Arcane.app.users.userRef(uid).set(lastUser);
    } else {
      lastUser = snap.data()!;
    }
  }

  Future<void> _ensureUserCapabilities(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snap =
        await Arcane.app.users.userCapabilitiesRef(uid).get();

    if (!snap.exists) {
      lastUserCapabilities =
          Arcane.app.users.onCreateUserCapabilities(ArcaneUserInfo(
        firstName: _grabFirstName ??
            auth.FirebaseAuth.instance.currentUser!.displayName!
                .split(" ")
                .first,
        lastName: _grabLastName ??
            auth.FirebaseAuth.instance.currentUser!.displayName!
                .split(" ")
                .last,
        email: auth.FirebaseAuth.instance.currentUser!.email!,
        uid: uid,
      ));
      await Arcane.app.users
          .userCapabilitiesRef(uid)
          .set(Map.of(lastUserCapabilities));
    } else {
      lastUserCapabilities = snap.data()!;
    }
  }

  Future<void> _ensureUserPrivate(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snap =
        await Arcane.app.users.userPrivateRef(uid).get();

    if (!snap.exists) {
      lastUserPrivate = Arcane.app.users.onCreateUserPrivate(ArcaneUserInfo(
        firstName: _grabFirstName ??
            auth.FirebaseAuth.instance.currentUser!.displayName!
                .split(" ")
                .first,
        lastName: _grabLastName ??
            auth.FirebaseAuth.instance.currentUser!.displayName!
                .split(" ")
                .last,
        email: auth.FirebaseAuth.instance.currentUser!.email!,
        uid: uid,
      ));
      await Arcane.app.users.userPrivateRef(uid).set(Map.of(lastUserPrivate));
    } else {
      lastUserPrivate = snap.data()!;
    }
  }
}
