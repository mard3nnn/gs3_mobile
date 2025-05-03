class LoginServiceFixture {
  static Map<String, dynamic> loginResponse = {
    "success": true,
    "message": null,
    "data": {
      "access_token": "token",
      "user": {
        "id": 1,
        "name": "Test User",
        "email": "test@example.com",
        "email_verified_at": "2025-05-01T02:49:54.000000Z",
        "created_at": "2025-05-01T02:49:54.000000Z",
        "updated_at": "2025-05-01T02:49:54.000000Z",
      },
      "permissions": ["see virtual cards", "see aditional card"]
    }
  };
}
