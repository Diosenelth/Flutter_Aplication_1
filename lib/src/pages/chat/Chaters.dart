class Chaters {
  String nombre = "nombre"; 
  String ultimoMensaje = "mensaje"; 
  String foto = "imagen";
  String hora = "tiempo";
  bool enActividad = false;

  Chaters(String nombre, String ultimoMensaje, String foto, String hora, bool enActividad){
    this.nombre = nombre;
    this.ultimoMensaje = ultimoMensaje;
    this.foto = foto;
    this.hora = hora;
    this.enActividad = enActividad;
  }
}

List listaChat = [
  Chaters(
    "Galy Galilei", 
    "Todavía se mueve", 
    "assets/Portrait_Placeholder.png", 
    "24 horas", 
    false
  ),
  Chaters(
    "Galy Galilei", 
    "Todavía se mueve", 
    "assets/Portrait_Placeholder.png", 
    "24 horas", 
    false
  ),
  Chaters(
    "Simón Tolomeo", 
    "Necesito un baño", 
    "assets/Portrait_Placeholder.png", 
    "1 minuto", 
    true
  ),
  Chaters(
    "Dorothy Oz", 
    "I'm not anymore in Kansas", 
    "assets/Portrait_Placeholder.png", 
    "30 minutos", 
    false
  ),
  Chaters(
    "Yisus Nazar", 
    "Rome is love", 
    "assets/Portrait_Placeholder.png", 
    "3 días", 
    true
  ),
  Chaters(
    "Lupita Soler", 
    "Bep, bep!", 
    "assets/Portrait_Placeholder.png", 
    "11 minutos", 
    false
  ),
  Chaters(
    "Giacomo Casanova", 
    "Ciao!", 
    "assets/Portrait_Placeholder.png", 
    "45 minutos", 
    false
  ),
];