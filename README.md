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
    * `dob` format is: YYYY-MM-DD
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
      "dob": "1990-12-01",
      "postalCode": "408600",
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
      "dob": "1990-12-01",
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
        "memberId": "vo7nqi822144",
        "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZW1iZXJJZCI6InZvN25xaTgyMjE0NCIsImlkIjo1LCJwaG9uZU51bWJlciI6IjA5MzgzODM4MzgiLCJpYXQiOjE1NDMzMTI4NzcsImV4cCI6MTU0MzM5OTI3N30.PVqzNMYRuancmt8hvkanYEDEwsDjVS6gZ2EphL0Fzxw",
        "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZW1iZXJJZCI6InZvN25xaTgyMjE0NCIsImlkIjo1LCJwaG9uZU51bWJlciI6IjA5MzgzODM4MzgiLCJyZWZyZXNoVG9rZW4iOnRydWUsImlhdCI6MTU0MzMxMjg3NywiZXhwIjoxNTQzMzk5Mjc3fQ.oWpMGYn-x0kjJZBmSWHlv4AwyKhZC4zUAyumBMz6aOI"
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
        "followed": true,
        "type": "shop",
        "id": 25
      },
      {
        "name": "Fashion in English",
        "followed": true,
        "type": "shop",
        "id": 26
      },
      {
        "name": "JewelleryandWatches in English",
        "followed": false,
        "type": "shop",
        "id": 27
      },
      {
        "name": "SushiBar in English",
        "followed": false,
        "type": "dine",
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
        "paymentMethodsIds": [27, 28],
        "halalCertified": true
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
14. **Request OTP**
  * URL: `/users/requestOTP`
  * Method: `POST`
  * Params:
    ```
      {
          "message": "OTP has been sent to your phone",
          "OTPcode": "598170"
      }
    ```
15. **Landing API**
  * URL: `/landing/`
  * Method: `GET`
  * Params: required `accessToken`
  * Response
    ```
    {
      "campaigns": [
        {
          "id": 7,
          "name": "Campaign 0",
          "startDate": "2018-12-10T08:22:15.000Z",
          "endDate": "2018-12-27T08:22:15.000Z",
          "bannerImageUrl": "http://lorempixel.com/640/480/",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/",
          "description": "Campaign 0 in English"
        },
        {
          "id": 8,
          "name": "Campaign 1",
          "startDate": "2018-12-10T08:22:15.000Z",
          "endDate": "2018-12-27T08:22:15.000Z",
          "bannerImageUrl": "http://lorempixel.com/640/480/",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/",
          "description": "Campaign 1 in English"
        },
        {
          "id": 9,
          "name": "Campaign 2",
          "startDate": "2018-12-10T08:22:15.000Z",
          "endDate": "2018-12-27T08:22:15.000Z",
          "bannerImageUrl": "http://lorempixel.com/640/480/",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/",
          "description": "Campaign 2 in English"
        }
      ],
      "followings": [
        {
          "dataType": "Deal",
          "id": 181,
          "name": "DEAL 1",
          "startDate": "2018-12-10T08:22:14.000Z",
          "endDate": "2018-12-27T08:22:14.000Z",
          "dealType": "shop",
          "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
          "title": "DEAL 1 in English",
          "subtitle": "subtitle DEAL 1 in English"
        },
        {
          "dataType": "Event",
          "id": 12,
          "name": "Event 2",
          "startDate": "2018-12-10T08:22:14.000Z",
          "endDate": "2018-12-27T08:22:14.000Z",
          "location": "#19 - 3",
          "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
          "title": "Event 2 in English",
          "subtitle": "subtitle Event 2 in English"
        }
      ],
      "shops": [
        {
          "id": 182,
          "name": "DEAL 2",
          "startDate": "2018-12-10T08:22:14.000Z",
          "endDate": "2018-12-27T08:22:14.000Z",
          "dealType": "shop",
          "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
          "title": "DEAL 2 in English",
          "subtitle": "subtitle DEAL 2 in English"
        },
        {
          "id": 184,
          "name": "DEAL 4",
          "startDate": "2018-12-10T08:22:14.000Z",
          "endDate": "2018-12-27T08:22:14.000Z",
          "dealType": "shop",
          "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
          "title": "DEAL 4 in English",
          "subtitle": "subtitle DEAL 4 in English"
        },
        {
          "id": 186,
          "name": "DEAL 5",
          "startDate": "2018-12-10T08:22:14.000Z",
          "endDate": "2018-12-27T08:22:14.000Z",
          "dealType": "shop",
          "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
          "title": "DEAL 5 in English",
          "subtitle": "subtitle DEAL 5 in English"
        },
        {
          "id": 183,
          "name": "DEAL 3",
          "startDate": "2018-12-10T08:22:14.000Z",
          "endDate": "2018-12-27T08:22:14.000Z",
          "dealType": "shop",
          "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
          "title": "DEAL 3 in English",
          "subtitle": "subtitle DEAL 3 in English"
        },
        {
          "id": 185,
          "name": "DEAL 0",
          "startDate": "2018-12-10T08:22:14.000Z",
          "endDate": "2018-12-27T08:22:14.000Z",
          "dealType": "shop",
          "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
          "title": "DEAL 0 in English",
          "subtitle": "subtitle DEAL 0 in English"
        }
      ],
      "dines": [
        {
          "id": 191,
          "name": "DEAL 10",
          "startDate": "2018-12-10T08:22:14.000Z",
          "endDate": "2018-12-27T08:22:14.000Z",
          "dealType": "dine",
          "bannerImageUrl": "http://lorempixel.com/640/480/food",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/food",
          "title": "DEAL 10 in English",
          "subtitle": "subtitle DEAL 10 in English"
        },
        {
          "id": 189,
          "name": "DEAL 8",
          "startDate": "2018-12-10T08:22:14.000Z",
          "endDate": "2018-12-27T08:22:14.000Z",
          "dealType": "dine",
          "bannerImageUrl": "http://lorempixel.com/640/480/food",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/food",
          "title": "DEAL 8 in English",
          "subtitle": "subtitle DEAL 8 in English"
        },
        {
          "id": 192,
          "name": "DEAL 11",
          "startDate": "2018-12-10T08:22:14.000Z",
          "endDate": "2018-12-27T08:22:14.000Z",
          "dealType": "dine",
          "bannerImageUrl": "http://lorempixel.com/640/480/food",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/food",
          "title": "DEAL 11 in English",
          "subtitle": "subtitle DEAL 11 in English"
        },
        {
          "id": 190,
          "name": "DEAL 9",
          "startDate": "2018-12-10T08:22:14.000Z",
          "endDate": "2018-12-27T08:22:14.000Z",
          "dealType": "dine",
          "bannerImageUrl": "http://lorempixel.com/640/480/food",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/food",
          "title": "DEAL 9 in English",
          "subtitle": "subtitle DEAL 9 in English"
        }
      ],
      "ionExperiences": [
        {
          "id": 16,
          "memberOnly": false,
          "startDate": "2018-12-10T21:31:21.000Z",
          "endDate": "2018-12-27T21:31:21.000Z",
          "bannerImageUrl": "http://lorempixel.com/640/480/",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/",
          "Brand": {
            "id": 244,
            "name": "Bernhard - Graham"
          },
          "title": "title of Ion Sky Deal 0 in English",
          "description": "description of Ion Sky Deal 0 in English",
          "tnc": "term and condition of Ion Sky Deal 0 in English"
        },
        {
          "id": 17,
          "memberOnly": true,
          "startDate": "2018-12-10T21:31:21.000Z",
          "endDate": "2018-12-27T21:31:21.000Z",
          "bannerImageUrl": "http://lorempixel.com/640/480/",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/",
          "Brand": {
            "id": 252,
            "name": "Streich - Hudson"
          },
          "title": "title of Ion Sky Deal 1 in English",
          "description": "description of Ion Sky Deal 1 in English",
          "tnc": "term and condition of Ion Sky Deal 1 in English"
        },
        {
          "id": 18,
          "memberOnly": false,
          "startDate": "2018-12-10T21:31:21.000Z",
          "endDate": "2018-12-27T21:31:21.000Z",
          "bannerImageUrl": "http://lorempixel.com/640/480/",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/",
          "Brand": {
            "id": 242,
            "name": "Wisozk - Considine"
          },
          "title": "title of Ion Sky Deal 2 in English",
          "description": "description of Ion Sky Deal 2 in English",
          "tnc": "term and condition of Ion Sky Deal 2 in English"
        }
      ]
    }
    ```
16. **Get Campaign**
  * URL: `/campaigns/:id`
  * Method: `GET`
  * Response:
    ```
    {
      "id": 7,
      "name": "Campaign 0",
      "startDate": "2018-12-10T08:22:15.000Z",
      "endDate": "2018-12-27T08:22:15.000Z",
      "bannerImageUrl": "http://lorempixel.com/640/480/",
      "thumbnailImageUrl": "http://lorempixel.com/640/480/",
      "description": "Campaign 0 in English",
      "Events": [
        {
          "id": 178,
          "startDate": "2018-12-10T08:22:14.000Z",
          "endDate": "2018-12-27T08:22:14.000Z",
          "bannerImageUrl": "http://lorempixel.com/640/480/food",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/food",
          "location": "#19 - 3",
          "title": "EVENT 9 in English",
          "description": "Event 9 Description in English",
          "Brand": {
            "id": 190,
            "name": "Kuhlman LLC",
            "level": "L1",
            "unit": "0",
            "phone": "109-075-8161 x295",
            "bannerImageUrl": "http://lorempixel.com/640/480/food",
            "thumbnailImageUrl": "http://lorempixel.com/640/480/food",
            "openingDate": null,
            "comingStatus": "opening",
            "CategoryId": 190,
            "operatingDays": "Monday - Friday",
            "operatingHours": "07:30 AM - 08:30PM"
          }
        },
        {
          "id": 176,
          "startDate": "2018-12-10T08:22:14.000Z",
          "endDate": "2018-12-27T08:22:14.000Z",
          "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
          "location": "#10 - 83",
          "title": "EVENT 7 in English",
          "description": "Event 7 Description in English",
          "Brand": {
            "id": 188,
            "name": "Little - Satterfield",
            "level": "L5",
            "unit": "27",
            "phone": "(625) 195-6614",
            "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
            "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
            "openingDate": null,
            "comingStatus": "none",
            "CategoryId": 188,
            "operatingDays": "Monday - Friday",
            "operatingHours": "07:30 AM - 08:30PM"
          }
        },
        {
          "id": 173,
          "startDate": "2018-12-10T08:22:14.000Z",
          "endDate": "2018-12-27T08:22:14.000Z",
          "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
          "location": "#2 - 16",
          "title": "EVENT 4 in English",
          "description": "Event 4 Description in English",
          "Brand": {
            "id": 185,
            "name": "Smith - Altenwerth",
            "level": "L5",
            "unit": "56",
            "phone": "835.541.3922 x861",
            "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
            "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
            "openingDate": null,
            "comingStatus": "none",
            "CategoryId": 186,
            "operatingDays": "Monday - Friday",
            "operatingHours": "07:30 AM - 08:30PM"
          }
        }
      ],
      "Deals": [
        {
          "id": 188,
          "startDate": "2018-12-10T08:22:14.000Z",
          "endDate": "2018-12-27T08:22:14.000Z",
          "dealType": "shop",
          "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
          "name": "DEAL 7",
          "publishDate": null,
          "quantity": 0,
          "createdAt": "2018-12-12T08:22:14.000Z",
          "updatedAt": "2018-12-12T08:22:14.000Z",
          "title": "DEAL 7 in English",
          "subtitle": "subtitle DEAL 7 in English",
          "Brands": [
            {
              "id": 187,
              "name": "Lehner, Oberbrunner and Kassulke",
              "level": "L1",
              "unit": "47",
              "phone": "141-859-6738 x90837",
              "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
              "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
              "openingDate": null,
              "comingStatus": "reOpening",
              "CategoryId": 187,
              "operatingDays": "Monday - Friday",
              "operatingHours": "07:30 AM - 08:30PM"
            },
          ]
        },
        {
          "id": 191,
          "startDate": "2018-12-10T08:22:14.000Z",
          "endDate": "2018-12-27T08:22:14.000Z",
          "dealType": "dine",
          "bannerImageUrl": "http://lorempixel.com/640/480/food",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/food",
          "name": "DEAL 10",
          "publishDate": null,
          "quantity": null,
          "createdAt": "2018-12-12T08:22:14.000Z",
          "updatedAt": "2018-12-12T08:22:14.000Z",
          "title": "DEAL 10 in English",
          "subtitle": "subtitle DEAL 10 in English",
          "Brands": [
            {
              "id": 183,
              "name": "Hammes LLC",
              "level": "L55",
              "unit": "68",
              "phone": "800-535-6788",
              "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
              "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
              "openingDate": null,
              "comingStatus": "opening",
              "CategoryId": 183,
              "operatingDays": "Monday - Friday",
              "operatingHours": "07:30 AM - 08:30PM"
            },
          ]
        }
      ]
    }
    ```
17. **Get Event**
  * URL: `/events/:id`
  * Method: `GET`
  * Response:
    ```
    {
      "id": 245,
      "startDate": "2018-12-10T21:31:21.000Z",
      "endDate": "2018-12-27T21:31:21.000Z",
      "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
      "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
      "location": "#1 - 94",
      "title": "EVENT 4 in English",
      "description": "Event 4 Description in English",
      "Brands": [{
        "id": 245,
        "name": "Zemlak LLC",
        "level": "B3",
        "unit": "5",
        "phone": "041.285.5223 x600",
        "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
        "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
        "openingDate": null,
        "comingStatus": "opening",
        "CategoryId": 233,
        "operatingDays": ["Monday - Friday", "Saturday, Sunday and holiday"],
        "operatingHours": ["07:30 AM - 08:30PM", "10:00 AM - 10:00 PM"]
      }]
    }
    ```
19. **Get Categories & Brands Names (Use in Smart Search)**
  * URL: `/categories/nameOnly`
  * Method: `GET`
  * Response: (status 200)
    ```
      [
        {
          "dataType": "Category",
            "id": 265,
            "name": "LuxuryFashionAndFashionAccessories"
        },
        {
          "dataType": "Category",
          "id": 266,
          "name": "Fashion"
        },
        {
          "dataType": "Brand",
          "id": 266,
          "name": "Beahan LLC"
        },
        {
          "dataType": "Brand",
          "id": 267,
          "name": "Jaskolski LLC"
        }
      ]
    ```
20. **Forgot Password**
  * URL: `/users/forgotPassword`
  * Method: `POST`
  * Params:
    ```
      {
        "phoneNumber": "01239393939",
        "code": "102282",
        "password": "newPassword",
      }
    ```
  * Success Response: (status 200)
    ```
      {
        "message": "SUCCESS"
      }
    ```
  * Failed Response: (status 400)
    ```
      {
        "message": "Your OTP or phone number is not correct"
      }
    ```
21. **Get Brand Detail**
  * URL: `/brands/:id`
  * Method: `GET`
  * Params: `accessToken` is required
  * Success Response: (status 200)
    ```
      {
        "id": 265,
          "name": "Jacobson - Bins",
          "unit": "2",
          "level": "L1",
          "phone": "1-828-122-8884",
          "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
          "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
          "comingStatus": "reOpening",
          "operatingHours": [
            "07:30 AM - 08:30PM",
          "9:00 AM - 10:00 PM"
          ],
          "operatingDays": [
            "Monday - Friday",
          "Saturday - Sunday, Public Holidays"
          ],
          "followed": true,
          "Deals": [
          {
            "id": 277,
            "startDate": "2018-12-11T04:14:37.000Z",
            "endDate": "2018-12-28T04:14:37.000Z",
            "dealType": "shop",
            "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
            "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
            "name": "DEAL 0",
            "publishDate": null,
            "quantity": null,
            "createdAt": "2018-12-13T04:14:37.000Z",
            "updatedAt": "2018-12-13T04:14:37.000Z",
            "title": "DEAL 0 in English",
            "subtitle": "subtitle DEAL 0 in English",
            "Brands": [
            {
              "id": 270,
              "name": "Gleichner LLC"
            },
            {
              "id": 273,
              "name": "Greenfelder, Lindgren and Greenholt"
            },
            {
              "id": 275,
              "name": "Hessel, Hermann and Gerhold"
            },
            {
              "id": 265,
              "name": "Jacobson - Bins"
            }
            ]
          },
          ],
          "Events": [
          {
            "id": 265,
            "startDate": "2018-12-11T04:14:37.000Z",
            "endDate": "2018-12-28T04:14:37.000Z",
            "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
            "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
            "location": "#1 - 12",
            "title": "EVENT 0 in English",
            "description": "Event 0 Description in English",
            "Brands": [
            {
              "id": 265,
              "name": "Jacobson - Bins"
            }
            ]
          }
          ]
      }
        ```
      * Failed Response: (status 400)
        ```
          {
            "message": "Brand not found"
          }
        ```
22. **Get Category Detail**
  * URL: `/categories/:id`
  * Method: `GET`
  * Params: `accessToken` is required
  * Success Response: (status 200)
    ```
      {
        "id": 267,
        "name": "JewelleryandWatches",
        "followed": true,
        "Brands": [
          {
            "id": 266,
            "name": "Beahan LLC"
          }
        ],
        "Deals": [
          {
            "id": 281,
            "startDate": "2018-12-11T04:14:37.000Z",
            "endDate": "2018-12-28T04:14:37.000Z",
            "dealType": "shop",
            "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
            "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
            "name": "DEAL 4",
            "publishDate": null,
            "quantity": 20,
            "createdAt": "2018-12-13T04:14:37.000Z",
            "updatedAt": "2018-12-13T04:14:37.000Z",
            "title": "DEAL 4 in English",
            "subtitle": "subtitle DEAL 4 in English",
            "Brands": [
              {
                "id": 275,
                "name": "Hessel, Hermann and Gerhold"
              },
              {
                "id": 276,
                "name": "McLaughlin and Sons"
              },
              {
                "id": 266,
                "name": "Beahan LLC"
              },
              {
                "id": 269,
                "name": "Moen, Rogahn and Borer"
              }
            ]
          },
          {
            "id": 280,
            "startDate": "2018-12-11T04:14:37.000Z",
            "endDate": "2018-12-28T04:14:37.000Z",
            "dealType": "shop",
            "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
            "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
            "name": "DEAL 3",
            "publishDate": null,
            "quantity": 5,
            "createdAt": "2018-12-13T04:14:37.000Z",
            "updatedAt": "2018-12-13T04:14:37.000Z",
            "title": "DEAL 3 in English",
            "subtitle": "subtitle DEAL 3 in English",
            "Brands": [
              {
                "id": 266,
                "name": "Beahan LLC"
              },
              {
                "id": 274,
                "name": "Huel, Mayer and Walsh"
              },
              {
                "id": 273,
                "name": "Greenfelder, Lindgren and Greenholt"
              },
              {
                "id": 268,
                "name": "Ryan, Lemke and Botsford"
              }
            ]
          },
          {
            "id": 278,
            "startDate": "2018-12-11T04:14:37.000Z",
            "endDate": "2018-12-28T04:14:37.000Z",
            "dealType": "shop",
            "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
            "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
            "name": "DEAL 1",
            "publishDate": null,
            "quantity": 5,
            "createdAt": "2018-12-13T04:14:37.000Z",
            "updatedAt": "2018-12-13T04:14:37.000Z",
            "title": "DEAL 1 in English",
            "subtitle": "subtitle DEAL 1 in English",
            "Brands": [
              {
                "id": 272,
                "name": "Kshlerin, Bergnaum and Christiansen"
              },
              {
                "id": 269,
                "name": "Moen, Rogahn and Borer"
              },
              {
                "id": 273,
                "name": "Greenfelder, Lindgren and Greenholt"
              },
              {
                "id": 266,
                "name": "Beahan LLC"
              }
            ]
          },
          {
            "id": 284,
            "startDate": "2018-12-11T04:14:37.000Z",
            "endDate": "2018-12-28T04:14:37.000Z",
            "dealType": "shop",
            "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
            "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
            "name": "DEAL 7",
            "publishDate": null,
            "quantity": null,
            "createdAt": "2018-12-13T04:14:37.000Z",
            "updatedAt": "2018-12-13T04:14:37.000Z",
            "title": "DEAL 7 in English",
            "subtitle": "subtitle DEAL 7 in English",
            "Brands": [
              {
                "id": 269,
                "name": "Moen, Rogahn and Borer"
              },
              {
                "id": 266,
                "name": "Beahan LLC"
              },
              {
                "id": 272,
                "name": "Kshlerin, Bergnaum and Christiansen"
              }
            ]
          }
        ],
        "Events": [
          {
            "id": 266,
            "startDate": "2018-12-11T04:14:37.000Z",
            "endDate": "2018-12-28T04:14:37.000Z",
            "bannerImageUrl": "http://lorempixel.com/640/480/fashion/",
            "thumbnailImageUrl": "http://lorempixel.com/640/480/fashion/",
            "location": "#2 - 68",
            "title": "EVENT 1 in English",
            "description": "Event 1 Description in English",
            "Brands": [
              {
                "id": 266,
                "name": "Beahan LLC"
              }
            ]
          }
        ]
      }
    ```
23. **Follow Brands**
  * URL: `/brands/follow`
  * Method: `POST`
  * Params:
    ```
      {
        "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZW1iZXJJZCI6Ing5NXB5czgyMjE1MiIsImlkIjo4LCJwaG9uZU51bWJlciI6IjAyMDAwMDAwMCIsImNhcmRObyI6IjgwMDAwMTIyMyIsImlhdCI6MTU0NDY5NjYxNiwiZXhwIjoxNTQ0NzgzMDE2fQ.60lrFs3L9Qd0L06MmZqJmBE0HBvHQQpxq-qfYnmt5lI",
        "categoryIds": [267, 268]
      }
    ```
  * Success Response: (status 200)
    ```
      {
        "message": "follows brands successfully"
      }
    ```
24. **Unfollow Brands**
  * URL: `/brands/unfollow`
  * Method: `POST`
  * Params: `accessToken`, `brandIds`
  * Success Response: (status 200)
    ```
      {
        "message": "unfollows brands successfully"
      }
    ```
25. **Unfollow Categories**
  * URL: `/categories/unfollow`
  * Method: `POST`
  * Params: `accessToken`, `categoryIds`
  * Success Response: (status 200)
    ```
      {
        "message": "unfollows categories successfully"
      }
    ```
26. **Get Following Brands and Categories**
  * URL: `/followings`
  * Method: `GET`
  * Params: `accessToken`
  * Success Response: (status 200)
    ```
    [
      {
        "id": 26,
        "name": "Fashion in English",
        "dataType": "Category",
      },
      {
        "id": 27,
        "name": "JewelleryandWatches in English",
        "dataType": "Brand",
      }
    ]
    ```
27. **Event RSVP Register**
  * URL: `/events/:id/rsvp`
  * Method: `POST`
  * Params: `accessToken`, `paxNo`
  * Success Response: (status 200)
    ```
      {
        "message": "Registered rsvp successfully !"
      }
    ```

28. **Get Outlets for Receipt**
  * URL: `/receipts/outlets`
  * Method: `GET`

29. **Submit Receipt**
  * URL: `/receipts/submit`
  * Method: `POST`
  * Params: `accessToken`, `receipt`, `outletCode`, `receiptDate` (YYYY-MM-DD)

30. **Save Deal**
  * URL: `/deals/:id/save`
  * Method: `POST`
  * Params: `accessToken`, `dealId`
  * Success Response: (status 200)
    ```
      {
        "message": "The deal is savedsuccessfully",
      }
    ```

31. **Verify Redemption**
  * URL: `/deals/:id/verify`
  * Method: `POST`
  * Params: `accessToken`, `pinCode`
  * Success Response: (status 200)
    ```
      {
        "message": "this redeemption has been verified successfully",
      }
    ```
  * Failed Response: (status 400)
    ```
      {
        "message": "the merchant pin code is not correct",
      }
    ```

32. **Redeem Deal**
  * URL: `/deals/:id/redeem`
  * Method: `POST`
  * Params: `accessToken`
  * Success Response: (status 200)
    ```
      {
        "message": "Registered rsvp successfully !",
        "merchantReferrence": "MERCHANT-234-1-102389483993"
      }
    ```

33. **Get all Saved Deals**
  * URL: `/wallets/savedDeals`
  * Method: `GET`
  * Params: `accessToken`
  * Success Response: (status 200)
    ```
      [
        {
          "id": 50,
          "startDate": "2018-12-13T05:50:14.000Z",
          "endDate": "2018-12-30T05:50:14.000Z",
          .....
          "redeemed": true
        }
        {
          "id": 55,
          "startDate": "2018-12-13T05:50:14.000Z",
          "endDate": "2018-12-30T05:50:14.000Z",
          .....
          "redeemed": false
        }
      ]
    ```
34. **Get Car Park Points**
  * URL: `/carParks`
  * Method: `GET`
  * Params: `accessToken` is required
  * Success Response: (status 200)
    ```
    {
      carParkPoints: 383.5,
      expiryDate: '2019-03-31T00:00:00.000',
      points: 2939
    }
    ```
  * Failed Response: (Status 400)
    ```
    {
      message: 'INVALID MEMBER'
    }
    ```
35. **Convert Car Park Points**
  * URL: `/carParks/convert`
  * Method: `POST`
  * Params: `accessToken`, `points` (<= 20)
  * Success Response: (status 200)
    ```
    {
      carParkPoints: 387.5,
      expiryDate: '2019-03-31T00:00:00.000',
      points: 2929
    }
    ```
  * Failed Response: (Status 400)
    ```
    {
      message: 'INVALID MEMBER'
    }
    ```
36. **Submit Receipt**
  * URL: `/receipts/submit`
  * Method: `POST`
  * Params: `accessToken`, `receipt`, `receiptDate` (YYYY-MM-DD)
  * Success Response: (status 200)
    ```
    {
      message: "success",
    }
    ```
37. **Get Receipts**
  * URL: `/receipts`
  * Method: `GET`
  * Params: `accessToken`
  * Success Response: (status 200)
    ```
    [
      {
        "amount": 0,
        "receipt": "https://uatweb.ascentis.com.sg/IONReceiptService/img/getimage.ashx?ID=cafd8e7d-61b9-4c6f-b9f0-44481afc4ff4",
        "submittedAt": "17 Dec 2018",
        "status": "success",
        "outlet": "01-HQ"
      },
      {
        "amount": 0,
        "receipt": "https://uatweb.ascentis.com.sg/IONReceiptService/img/getimage.ashx?ID=fcf10f01-adce-4968-99cc-831a61d04557",
        "submittedAt": "17 Dec 2018",
        "status": "pending",
        "outlet": "CHOMEL"
      },
      {
        "amount": 0,
        "receipt": "https://uatweb.ascentis.com.sg/IONReceiptService/img/getimage.ashx?ID=8e9a6dc4-3915-4f2b-a8b3-7318b0fdc7b7",
        "submittedAt": "17 Dec 2018",
        "status": "pending",
        "outlet": ""
      },
    ]
    ```
38. **Get Profile**
  * URL: `/users/getProfile`
  * Method: `GET`
  * Params: `accessToken`
  * Success Response: (status 200)
    ```
      {
        "familyName": "Vo",
        "givenName": "Vinh",
        "gender": "male",
        "email": "vinh.vo@2359media.com",
        "dob": "1990-12-18T00:00:00",
        "nationality": "Singaporean",
        "country": "Singapore",
        "isTourist": true
      }
    ```
38. **Update Profile**
  * URL: `/users/updateProfile`
  * Method: `POST`
  * Params: `accessToken`, others are the same as SignUp

39. **Refresh Token**
  * URL: `/refreshToken`
  * Method: `POST`
  * Params: `refreshToken`
  * Response:
    ```
      {
          "memberId": "x95pys822152",
          "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZW1iZXJJZCI6Ing5NXB5czgyMjE1MiIsImlkIjo4LCJwaG9uZU51bWJlciI6IjAyMDAwMDAwMCIsImNhcmRObyI6IjgwMDAwMTIyMyIsImlhdCI6MTU0NTI5ODY3NiwiZXhwIjoxNTQ1Mzg1MDc2fQ.zohOzOGxEPyySfxw14W3VBjLM8jUUGDP4L8cTPl403s",
          "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZW1iZXJJZCI6Ing5NXB5czgyMjE1MiIsImlkIjo4LCJwaG9uZU51bWJlciI6IjAyMDAwMDAwMCIsImNhcmRObyI6IjgwMDAwMTIyMyIsInJlZnJlc2hUb2tlbiI6dHJ1ZSwiaWF0IjoxNTQ1Mjk4Njc2LCJleHAiOjE1NDUzODUwNzZ9.W6jhBlPa0lgwAyh0ssleb4iFYfui0BLKVc-KQgv98Rc"
      }
    ```
40. **Get Trackers**
  * URL: `/users/getTrackers`
  * Method: `GET`
  * Params: `accessToken`
  * NOTE:
    * There are 3 trackers from left to right: `pointsTracker`, `spentTracker` and `suiteTracker`
    * If a specific tracker is hidden, it will be `null`. The `spentTracker` and `suiteTracker` can be null.
    * Each tracker has top, center and bottom.
    * The first tracker has `currentPoints` and `nextPoints` for drawing the progress.
  * Response:
    ```
      {
        "pointsTracker": {
          "top": "Accumulate to",
          "center": "150 points",
          "bottom": "by 30-Sep-2019 to get S$60 voucher",
          "currentPoints": 123,
          "nextPoints": 150
        },
        "spentTracker": {
          "top": "Congratulations you have spent more than S$25000. Your membership upgrade to",
          "center": "ION Privilege",
          "bottom": "is being processed.",
          "currentPoints": 25000,
          "nextPoints": 25000
        },
        "suiteTracker": null
      }
    ```

41. ** GET IUs**
  * URL: `/users/getIUs`
  * Method: `GET`
  * Params: `accessToken`
  * Response:
    ```
      [
        {
          "IU": "1111111111",
          "active": "false"
        },
        {
          "IU": "8888888888",
          "active": "false"
        },
        {
          "IU": "9999999999",
          "active": "true"
        }
      ]
    ```

42. ** Update IUs**
  * URL: `/users/updateIUs`
  * Method: `POST`
  * Params:
    ```
      {
        "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
        "listIUs": [
          { "IU": "9999999999", "active": true },
          { "IU": "8888888888", "active": false }
        ]
      }
    ```
  * Response:
    ```
      [
        {
          "IU": "8888888888",
          "active": "false"
        },
        {
          "IU": "9999999999",
          "active": "true"
        }
      ]
    ```

42. **Check Password**
  * URL: `/users/checkPassword`
  * Method: `POST`
  * Params:
    ```
      {
        "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
        "password": "thisispassword"
      }
    ```
  * Response:
    ```
      { message: 'correct password' }
    ```
  * Failed Response: (Status 400)
    ```
      { message: 'wrong password' }
    ```

43. **Capitastars Get Points**
  * URL: `/capitastars`
  * Method: `GET`
  * Params:
    ```
      {
        "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      }
    ```
  * Response:
    ```
      {
        "totalPoints": 0,
        "convertable": true,
        "pointsMapping": [
          {
            "ionPoints": 25,
            "starsPoints": 10000
          },
          {
            "ionPoints": 50,
            "starsPoints": 20000
          },
          {
            "ionPoints": 75,
            "starsPoints": 30000
          },
          {
            "ionPoints": 100,
            "starsPoints": 40000
          },
          {
            "ionPoints": 125,
            "starsPoints": 50000
          }
        ]
      }
    ```

44. **Capitastars Convert Points**
  * URL: `/capitastars/convert`
  * Method: `POST`
  * Params:
    ```
      {
        "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
        "points": 25,
        "phoneNumber": 6597827002,
      }
    ```
  * Response: 
    ```
      {
        "success": true,
        "message": "25 ION+ Points converted to 10000 Star$. An admin charge of 10 ION+ Points has been deducted. Your current Star$ balance is 20000. Balance number of conversion(s) allowed for this year: 1"
      }
    ```
  * Failed Response: (status 400)
    ```
      {
        "success": false,
        "message": "Can not deduct ION points: NOT ENOUGH POINTS TO REDEEM"
      }
    ```

45. **Get Channels**
  * URL: `/channels`
  * Method: `GET`
  * Response: 
    ```
      [
        {
          "name": "pushNotification",
            "actvie": true
        },
        {
          "name": "notifyPost",
          "actvie": false
        },
        {
          "name": "notifySMS",
          "actvie": true
        },
        {
          "name": "call",
          "actvie": true
        }
      ]
    ```
46. **Get App Information**
  * URL: `/appInfo`
  * Method: `GET`
  * Response: Can be one of the following format
    ```
      {
        "appVersions": {
          "ios": "2.1.3",
          "android": "10.9.4"
        },
        "appAdvertisements": [
          "http://lorempixel.com/600/600",
          "http://lorempixel.com/600/600",
          "http://lorempixel.com/600/600"
        ],
        "seasonalBackground": "http://lorempixel.com/600/600"
      }
    ```
    OR
    ```
      {
        "appVersions": {
          "ios": "2.1.3",
          "android": "10.9.4"
        },
        "appAdvertisements": [
          "http://lorempixel.com/600/600",
          "http://lorempixel.com/600/600",
          "http://lorempixel.com/600/600"
        ],
        "seasonalBackground": null
      }
    ```
    OR
    ```
      { }
    ```
47. **Get Ion Sky Tickets**
  * URL: `ionSky/ticket`
  * Method: `GET`
  * Params: `accessToken` is required
  * Response: 
    ```
      {
        "success": true,
        "allocated": [
          {
            "date": "2019-02-10",
            "number": 5
          }
        ],
        "code": "ION-21555fd5febe43b0867dfdf6141cf207",
        "eventGroups": [
          {
            "eventDate": "2019-01-11",
            "eventGroupId": "77895e5b4a374adc9edb50043cf2a58b",
            "lines": [
              {
                "eventDatetime": "4:15 PM",
                "capacity": 40,
                "eventLineId": "e53e7236878b44038b9e46867ac15c1b"
              },
              {
                "eventDatetime": "5:00 PM",
                "capacity": 40,
                "eventLineId": "48697bcaafc44ef3bfe22afe93b3f618"
              },
              {
                "eventDatetime": "7:00 PM",
                "capacity": 40,
                "eventLineId": "6b4118323e6b49f48cd521955bf58c1d"
              },
              {
                "eventDatetime": "7:45 PM",
                "capacity": 40,
                "eventLineId": "70406cc637a94ff49bc683abbd77dbb6"
              }
            ]
          },
          {
            "eventDate": "2019-01-12",
            "eventGroupId": "68921411cf724247a33f37442087152d",
            "lines": [
              {
                "eventDatetime": "2:00 PM",
                "capacity": 40,
                "eventLineId": "1431c06d5df9455986d82098f584b3f5"
              },
              {
                "eventDatetime": "2:45 PM",
                "capacity": 40,
                "eventLineId": "67c30971cdb745f38c3788c2ea6165af"
              },
              {
                "eventDatetime": "3:30 PM",
                "capacity": 40,
                "eventLineId": "d23caea95d1547fb9433e96f5ba190c0"
              },
              {
                "eventDatetime": "4:15 PM",
                "capacity": 40,
                "eventLineId": "e83c771b20274eeea279bd74c16fb034"
              },
              {
                "eventDatetime": "5:00 PM",
                "capacity": 40,
                "eventLineId": "79248642d5e74c57b1d4abd283cb1772"
              },
              {
                "eventDatetime": "7:00 PM",
                "capacity": 40,
                "eventLineId": "6b095cdef0a94e15a18b22dc5b6d7ca2"
              },
              {
                "eventDatetime": "7:45 PM",
                "capacity": 40,
                "eventLineId": "dbdd8d5cc1aa4c6db8d391051fb647ef"
              }
            ]
          }
        ]
      }
    ```
48. **Book Ion Sky Ticket**
  * URL: `ionSky/bookTicket`
  * Method: `POST`
  * Params:
  ```
    {
      "credits": 1,
      "eventGroupId": "7177ee6256ba488bbe9baade6ceac196",
      "eventLineId": "d0e3ba6f4783467faea941b5e90712c9",
      "eventLineText": "2:00 PM",
      "ticketCode": "ION-21555fd5febe43b0867dfdf6141cf207",
      "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZW1iZXJJZCI6InZnZnhrcDgyMjU5OCIsImlkIjoyMTksInBob25lTnVtYmVyIjoiKzE5OTk5OTkxIiwiY2FyZE5vIjoiODAwMDAxNzA3IiwiaWF0IjoxNTQ3NDAwMzU0LCJleHAiOjE1NDc0ODY3NTR9.2mmmegJtSIYJVxTwSFDCgUbFGhhKqzKoZaIjQzHuvIo"
    }
  ```

  * Response: 
    ```
      {
        "success": true,
        "ticket": [
           {
            "qrImageUrl": "/api/pass/qr/get/image/97a13cb3ece644ac8cd78e8286ae4510/ION-21555fd5febe43b0867dfdf6141cf207/d623a0972bf54de5b613ed2b01470123.png",
            "user": {
              "userId": "800001707",
              "memberId": null,
              "companyName": null,
              "name": null,
              "nationality": null
            },
            "tikcetPassReference": "d623a0972bf54de5b613ed2b01470123",
            "freeQty": 48,
            "noOfCredits": 1,
            "unlockInMin": 0,
            "eventDate": "2019-01-14",
            "eventDateSession": "2:00 PM to 2:45 PM",
            "title": "Admission Ticket",
            "status": "1",
            "erroCode": "",
            "errorTimestamp": ""
          }
        ]
      }
    ```

49. **Get Ion Sky Tickets History**
  * URL: `ionSky/ticket/history`
  * Method: `GET`
  * Params: `accessToken` is required
  * Response: 
    ```
      {
        "success": true,
        "tickets": [
          {
            "qrImageUrl": "/api/pass/qr/get/image/3676bf57d3424c1f804df0499ec7c914/ION-21555fd5febe43b0867dfdf6141cf207/1163ed289c4745b5a98424f850113389.png",
            "freeQty": 1,
            "eventDate": "2019-01-18",
            "eventDateSession": "2:00 PM to 2:45 PM",
            "status": "valid"
          },
          {
            "qrImageUrl": "/api/pass/qr/get/image/7c52d6fe185947ed88c6e082e196b0b2/ION-21555fd5febe43b0867dfdf6141cf207/d623a0972bf54de5b613ed2b01470123.png",
            "freeQty": 1,
            "eventDate": "2019-01-15",
            "eventDateSession": "2:00 PM to 2:45 PM",
            "status": "redeemed"
          },
          {
            "qrImageUrl": "/api/pass/qr/get/image/a4c119349d2847ef9d1a7459baf5d985/ION-21555fd5febe43b0867dfdf6141cf207/1d02250a5f2d4781b68ccb6fd2191cad.png",
            "freeQty": 1,
            "eventDate": "2019-01-10",
            "eventDateSession": "2:00 PM to 2:45 PM",
            "status": "expired"
          }
        ]
      }
    ```
50. **Remove deal from wallet**
  * URL: `deals/:id/removeFromWallet`
  * Method: `POST`
  * Params: `accessToken` is required
  * Response: 
    ```
      {
        message: 'The deal has been removed successfully'
      }
    ```

51. **Add Device Token**
  * URL: `users/addDeviceToken`
  * Method: `POST`
  * Params: `accessToken`, `deviceToken`
  * Response: 
    ```
      {
        message: 'Add device token successfully'
      }
    ```

52. **Remove Device Token**
  * URL: `users/removeDeviceToken`
  * Method: `POST`
  * Params: `accessToken`, `deviceToken`
  * Response: 
    ```
      {
        message: 'Remove device token successfully'
      }
    ```
