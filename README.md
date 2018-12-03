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
5. **List All Categories**
  * URL: `/categories`
  * Method: `GET`
  * Response:
    ```
    [
      {
        "name": "LuxuryFashionAndFashionAccessories in English",
          "id": 25
      },
      {
        "name": "Fashion in English",
        "id": 26
      },
      {
        "name": "JewelleryandWatches in English",
        "id": 27
      },
      {
        "name": "HandbagsShoesandAccessories in English",
        "id": 28
      },
    ]
    ```
6. **Follow Catgories**
  * URL: `/categories/follow`
  * Method: `POST`
  * Params:
    ```
    {
      "accessToken": "<token>",
      "categoryIds": [25, 28],
    }
    ```
  * Response:
    ```
    {
      "message": "follows categories successfully"
    }
    ```
7. **Get Following Categories**
  * URL: `/categories/followings`
  * Method: `GET`
  * Params:
    ```
    {
      "accessToken": "<token>",
    }
    ```
  * Response:
    ```
    [
      {
        "id": 26,
        "name": "Fashion in English"
      },
      {
        "id": 27,
        "name": "JewelleryandWatches in English"
      }
    ]
    ```
8. **Get Levels**
  * URL: `/levels`
  * Method: `GET`
  * Response:
    ```
    [
      "B4", "B3", "B2",
      "B1", "L1", "L2",
      "L3", "L4", "L5",
      "L55", "L56"
    ]
    ```
9. **Get Payment Methods**
  * URL: `/paymentMethods`
  * Method: `GET`
  * Response:
    ```
    [
      {
        "id": 25,
        "name": "Visa/Master"
      },
      {
        "id": 26,
        "name": "Amex"
      },
      {
        "id": 27,
        "name": "UnionPay"
      },
      {
        "id": 28,
        "name": "WeChat"
      }
    ]
    ```
10. **Get Shopping/DiningDeals**
  * URL: `/deals`
  * Method: `GET`
  * Params:
    ```
      {
        "type": "shop",
        "level": ["B4", "L1", "L2"],
        "categoryIds": [25, 26],
        "paymentMethodsIds": [27, 28]
      }
    ```
      * `type` could be `shop` or `dine`
  * Response:
    ```
    [
      {
        "id": 29,
          "name": "DEAL 4",
          "startDate": "2018-12-01T00:39:43.000Z",
          "endDate": "2018-12-18T00:39:43.000Z",
          "dealType": "shop",
          "publishDate": null,
          "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
          "quantity": 0,
          "access": "none",
          "createdAt": "2018-12-03T00:39:43.000Z",
          "updatedAt": "2018-12-03T00:39:43.000Z",
          "Brands": [
          {
            "id": 29,
            "name": "Hettinger - Cummings",
            "PaymentMethods": [
            {
              "id": 25,
              "name": "Visa/Master",
              "BrandPayment": {
                "BrandId": 29,
                "PaymentMethodId": 25,
                "createdAt": "2018-12-03T02:33:48.000Z",
                "updatedAt": "2018-12-03T02:33:48.000Z"
              }
            },
            {
              "id": 32,
              "name": "Nets",
              "BrandPayment": {
                "BrandId": 29,
                "PaymentMethodId": 32,
                "createdAt": "2018-12-03T02:33:48.000Z",
                "updatedAt": "2018-12-03T02:33:48.000Z"
              }
            }
            ],
            "Category": {
              "id": 29,
              "name": "BeautyAndWellness"
            }
          }
        ]
      },
      {
        "id": 31,
        "name": "DEAL 6",
        "startDate": "2018-12-01T00:39:43.000Z",
        "endDate": "2018-12-18T00:39:43.000Z",
        "dealType": "shop",
        "publishDate": null,
        "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
        "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
        "quantity": 5,
        "access": "none",
        "createdAt": "2018-12-03T00:39:43.000Z",
        "updatedAt": "2018-12-03T00:39:43.000Z",
        "Brands": [
          {
            "id": 31,
            "name": "Goldner Inc",
            "PaymentMethods": [
            {
              "id": 27,
              "name": "UnionPay",
              "BrandPayment": {
                "BrandId": 31,
                "PaymentMethodId": 27,
                "createdAt": "2018-12-03T02:33:48.000Z",
                "updatedAt": "2018-12-03T02:33:48.000Z"
              }
            },
            {
              "id": 28,
              "name": "WeChat",
              "BrandPayment": {
                "BrandId": 31,
                "PaymentMethodId": 28,
                "createdAt": "2018-12-03T02:33:48.000Z",
                "updatedAt": "2018-12-03T02:33:48.000Z"
              }
            },
            {
              "id": 31,
              "name": "FavePay",
              "BrandPayment": {
                "BrandId": 31,
                "PaymentMethodId": 31,
                "createdAt": "2018-12-03T02:33:48.000Z",
                "updatedAt": "2018-12-03T02:33:48.000Z"
              }
            }
            ],
            "Category": {
              "id": 31,
              "name": "FineJewelleryAndWatches"
            }
          }
        ]
      }
    ]
    ```
11. **Get a Deal**
  * URL: `/deals/:id`
  * Method: `GET`
  * Response:
    ```
      {
        "id": 25,
        "name": "DEAL 0",
        "startDate": "2018-12-01T00:39:43.000Z",
        "endDate": "2018-12-18T00:39:43.000Z",
        "dealType": "shop",
        "publishDate": null,
        "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
        "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
        "quantity": null,
        "access": "IONRwardsMembers",
        "createdAt": "2018-12-03T00:39:43.000Z",
        "updatedAt": "2018-12-03T00:39:43.000Z",
        "Brands": [
          {
            "id": 25,
            "name": "Donnelly, Russel and Hermiston",
            "unit": "16",
            "level": "",
            "phone": "955.215.0544",
            "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
            "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
            "openingDate": null,
            "comingStatus": "reOpening",
            "CategoryId": 25,
            "operatingHours": "07:30 AM - 08:30PM",
            "operatingDays": "Monday - Friday",
            "BrandDeal": {
              "BrandId": 25,
              "DealId": 25,
              "createdAt": "2018-12-03T00:39:43.000Z",
              "updatedAt": "2018-12-03T00:39:43.000Z"
            }
          }
        ]
      }
    ```
12. **Redeem a Deal**
  * URL: `/deals/:id/redeem`
  * Method: `POST`
  * NOTE: `accessToken` is required
  * Success Response: (status 200)
    ```
      {
        "message": "Redeem the deal successfully"
      }
    ```
  * Failed Response: (status 400)
    ```
      {
        "message": "The deal is out of stock"
      }
    ```
13. **Check Merchant Code**
  * URL: `/deals/:id/checkMerchantCode`
  * Method: `POST`
  * NOTE: For testing, the passcode code is always: `1234`
  * Params:
    ```
      {
        "accessToken": "<token>",
        "code": "1234"
      }
    ```
  * Success Response: (status 200)
    ```
      {
        message: 'The passcode is correct',
        merchantReferrence: 1,
      }
    ```
  * Failed Response: (status 400)
    ```
      {
        "message": "The passcode is invalid"
      }
    ```
