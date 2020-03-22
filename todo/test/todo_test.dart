import 'dart:async';

import 'harness/app.dart';

Future main() async {
  final harness = Harness()..install();

  test("GET /todos returns 401 without access token", () async {
    expectResponse(await harness.agent.get("/todos"), 401);
  });

  test("GET /todos returns 200 with access token", () async {
    expectResponse(
      await harness.agent.get(
        "/todos",
        headers: {'Authorization': 'Bearer any'},
      ),
      200,
    );
  });
}
