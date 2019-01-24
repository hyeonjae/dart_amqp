part of dart_amqp.client;

class ConnectionSettings {

  // The host to connect to
  String host;

  // The port to connect to
  int port;

  // The connection vhost that will be sent to the server
  String virtualHost;

  // The max number of reconnection attempts before declaring a connection as unusable
  int maxConnectionAttempts;

  // The time to wait  before trying to reconnect
  Duration reconnectWaitTime;

  // Authentication provider
  Authenticator authProvider;

  // Protocol version
  int amqpProtocolVersion = 0;
  int amqpMajorVersion = 0;
  int amqpMinorVersion = 9;
  int amqpRevision = 1;

  // Tuning settings
  TuningSettings tuningSettings;

  // TLS settings
  SecurityContext tlsContext;

  ConnectionSettings(
    {
      String this.host : "127.0.0.1"
      , int this.port : 5672
      , String this.virtualHost : "/"
      , Authenticator this.authProvider : const PlainAuthenticator("guest", "guest")
      , int this.maxConnectionAttempts : 1
      , Duration this.reconnectWaitTime : const Duration(milliseconds : 1500)
      , TuningSettings this.tuningSettings
      , SecurityContext this.tlsContext
     }
  ){
    if( this.tuningSettings == null){
      tuningSettings = new TuningSettings();
    }
  }

}
