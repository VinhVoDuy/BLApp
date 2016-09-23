class SetExpressCheckout

end

curl -X POST 'https://api-3t.sandbox.paypal.com/nvp' --data 'USER=vinh.vo_api1.2359media.com&PWD=U4REVYAWPKR99ENX&SIGNATURE=AKFZqulOxy7207WmtS1y8JOIftDpAGkMMtosXuPGkJvN.7hA.8fLMXmb&METHOD=SetExpressCheckout&VERSION=95&PAYMENTREQUEST_0_PAYMENTACTION=Authorization&PAYMENTREQUEST_0_AMT=1&PAYMENTREQUEST_0_CURRENCYCODE=USD&cancelUrl=http://google.com.vn&returnUrl=http://github.com'

Endpoint URL: 
HTTP method: POST
POST data:
USER=merchant_user_name
&PWD=merchant_password
&SIGNATURE=merchant_signature
&METHOD=SetExpressCheckout
&VERSION=95
&PAYMENTREQUEST_0_PAYMENTACTION=Authorization   
&PAYMENTREQUEST_0_AMT=1    
&PAYMENTREQUEST_0_CURRENCYCODE=USD    
&cancelUrl=http://www.yourdomain.com/cancel.html    
&returnUrl=http://www.yourdomain.com/success.html 
