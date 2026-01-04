class ApiConfig {
  static const String baseUrl =
      'https://rpblbedyqmnzpowbumzd.supabase.co';

  static const String anonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.'
      'eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJwYmxiZWR5'
      'cW1uenBvd2J1bXpkIiwicm9sZSI6ImFub24iLCJpYXQi'
      'OjE3NTgxMjcxMjYsImV4cCI6MjA3MzcwMzEyNn0.'
      'QaMJlyqhZcPorbFUpImZAynz3o2l0xDfq_exf2wUrTs';

  static const Map<String, String> headers = {
    'apikey': anonKey,
    'Authorization': 'Bearer $anonKey',
    'Content-Type': 'application/json',
  };
}
