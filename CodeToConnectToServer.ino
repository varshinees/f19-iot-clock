/*
 *  This sketch sends a message to a TCP server
 *
 */

#include <WiFi.h>
#include <WiFiMulti.h>
#include <HTTPClient.h>

WiFiMulti WiFiMulti;

void setup()
{
    Serial.begin(115200);
    Serial.print("Starting");
    delay(10);

    // We start by connecting to a WiFi network
    const char* ssid     = "utexas-iot";
    const char* password = "7234415962323776";
    WiFiMulti.addAP(ssid, password);

    Serial.println();
    Serial.println();
    Serial.print("Waiting for WiFi... ");

    while(WiFiMulti.run() != WL_CONNECTED) {
        Serial.print(".");
        delay(500);
    }

    Serial.println("");
    Serial.println("WiFi connected");
    Serial.println("IP address: ");
    Serial.println(WiFi.localIP());

    delay(500);
}


void loop()
{
   HTTPClient http;
 
    http.begin("http://ancient-bastion-28512.herokuapp.com/data?x=10&y=20&z=30"); //Specify the URL
    int httpCode = http.GET();                                        //Make the request
 
    if (httpCode > 0) { //Check for the returning code
 
        String payload = http.getString();
        Serial.println(httpCode);
        Serial.println(payload);
      }
 
    else {
      Serial.println("Error on HTTP request");
    }
 
    http.end(); //Free the resources

    delay(5000);
  
    //const uint16_t port = 80;
//const char * host = "htt"; // ip or dns
//HttpClient http;
//http.begin("http://ancient-bastion-28512.herokuapp.com/available");
//http.addHeader("Content-Type", "application/x-www-form-urlencoded");
//http.get("http://ancient-bastion-28512.herokuapp.com/available");
//http.writeToStream(&Serial);
//http.end();
//   const uint16_t port = 80;
//   const char * host = "ancient-bastion-28512.herokuapp.com"; // ip or dns
//
//    Serial.print("Connecting to test ");
//    Serial.println(host);
//
//    // Use WiFiClient class to create TCP connections
//    WiFiClient client;
//
//    if (!client.connect(host, port)) {
//        Serial.println("fffff");
//        Serial.println("Connection failed.");
//        Serial.println("Waiting 5 seconds before retrying...");
//        delay(5000);
//        return;
//    }
//
//    // This will send a request to the server
//    //uncomment this line to send an arbitrary string to the server
//    //client.print("Send this data to the server");
//    //uncomment this line to send a basic document request to the server
//    client.println("GET /available HTTP/1.1\n\n");
////    client.println("\r");
//
//  int maxloops = 0;
//
//  //wait for the server's reply to become available
//  while (!client.available() && maxloops < 1000)
//  {
//    maxloops++;
//    delay(1); //delay 1 msec
//  }
//  if (client.available() > 0)
//  {
//    //read back one line from the server
//    String line = client.readStringUntil('\r');
//    Serial.println("Printing response");
//    Serial.println(line);
//  }
//  else
//  {
//    Serial.println("client.available() timed out ");
//  }
//
//    Serial.println("Closing connection.");
//    client.stop();
//
//    Serial.println("Waiting 5 seconds before restarting...");
//    delay(5000);
}
