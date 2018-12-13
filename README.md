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
      "ionSkyDeals": [
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
18. **Get Car Park Points**
  * URL: `/carParks`
  * Method: `GET`
  * Params: `accessToken` is required
  * Success Response: (status 200)
    ```
    {
      expiryDate: '2019-03-31T00:00:00.000',
      balance: '373.6'
    }
    ```
  * Failed Response: (Status 400)
    ```
    {
      message: 'INVALID MEMBER'
    }
    ```
19. **Get Categories & Brands Names**
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
