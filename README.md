# ION ORCHARD
### Base URL: http://ion-dev.ap-southeast-1.elasticbeanstalk.com

## APIs

1. **Sign Up**
  * URL: `/users/signUp`
  * Method: `POST`
  * NOTE:
    * `country` is required to be either "singapore" or "other"
    * If `country` is "other" then `nationality` and `countryOfResidence` are
      required
    * The OTPcode is returned on the API is just used for testing now. Will be
      removed on production
  * Params:
    ```
    {
      "familyName": "Vo",
      "givenName": "Vinh",
      "gender": "male",
      "email": "vinh.vo@2359media.com",
      "country": "singapore",
      "phoneNumber": "0938383838",
      "notifyPost": true,
      "notifySMS": true,
      "call": true,
      "password": "password"
    }
    ```
    **Or**
    ```
    {
      "familyName": "Vo",
      "givenName": "Vinh",
      "gender": "male",
      "email": "vinh.vo@2359media.com",
      "country": "other",
      "nationality": "Vietnamese",
      "countryOfResidence": "Malaysia",
      "phoneNumber": "0938383838",
      "notifyPost": true,
      "notifySMS": true,
      "call": true,
      "password": "password"
    }
    ```
  * Response:
    ```
      {
        "message":"OTP has been sent to your phone",
        "OTPcode":"567736"
      }
    ```

2. **Verify OTP**
  * URL: `/users/verifyOTP`
  * Method: `POST`
  * Params:
    ```
    {
      "phoneNumber": "0938383838",
      "code": "567736",
    }
    ```
  * Response:
    ```
      {
        "message": "Your phone number has been confirmed. You can login now
      }
    ```

3. **Login**
  * URL: `/users/login`
  * Method: `POST`
  * Params:
    ```
    {
      "phoneNumber": "0938383838",
      "password": "password",
    }
    ```
  * Response:
    ```
    {
      "memberId": "vo7nqi822144",
      "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZW1iZXJJZCI6InZvN25xaTgyMjE0NCIsImlkIjo1LCJwaG9uZU51bWJlciI6IjA5MzgzODM4MzgiLCJpYXQiOjE1NDMzMTI4NzcsImV4cCI6MTU0MzM5OTI3N30.PVqzNMYRuancmt8hvkanYEDEwsDjVS6gZ2EphL0Fzxw",
      "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZW1iZXJJZCI6InZvN25xaTgyMjE0NCIsImlkIjo1LCJwaG9uZU51bWJlciI6IjA5MzgzODM4MzgiLCJyZWZyZXNoVG9rZW4iOnRydWUsImlhdCI6MTU0MzMxMjg3NywiZXhwIjoxNTQzMzk5Mjc3fQ.oWpMGYn-x0kjJZBmSWHlv4AwyKhZC4zUAyumBMz6aOI"
    }
    ```

4. **Change Password**
  * URL: `/users/changePassword`
  * Method: `POST`
  * NOTE: `accessToken` is required
  * Params:
    ```
    {
      "oldPassword": "password",
      "password": "newpassword",
      "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZW1iZXJJZCI6IjIyMjc0MiIsImlkIjoxLCJwaG9uZU51bWJlciI6IjAzODk5MzgzNjAiLCJpYXQiOjE1NDMyMDYyOTEsImV4cCI6MTU0MzI5MjY5MX0.k4k5bvYEArfOlUIQazOYC64wQEuE-ZVwj53Tci1GPz8"
    }
    ```
  * Response:
    * Success:
      ```
      {
          "message": "SUCCESS"
      }
      ```
    * Failed (status 401)
      ```
      {
          "message": "You are not authorized"
      }
      ```
