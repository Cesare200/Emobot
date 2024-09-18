import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PsicologoApp(),
    );
  }
}

class PsicologoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00796B), // Color verde oscuro
        title: Text('Psicologo'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.grid_view),
            onPressed: () {},
          ),
        ],
      ),
      drawer: _buildMenu(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            SizedBox(height: 20),
            _buildCategoryTags(),
            SizedBox(height: 20),
            _buildMainTitle(),
            SizedBox(height: 10),
            _buildDescription(),
            SizedBox(height: 20),
            _buildTherapyCards(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showChatBubble(context),
        backgroundColor: Color(0xFF00796B), // Mismo color que el AppBar
        child: Icon(Icons.chat),
      ),
    );
  }

  Widget _buildMenu() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF004D40), // Color verde más oscuro
            ),
            child: Text(
              'Opciones (Menú)',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          _buildMenuOption(Icons.person, 'Mi Perfil', () {}),
          _buildMenuOption(
              Icons.medical_services, 'Nuestros Especialistas', () {}),
          _buildMenuOption(Icons.article, 'Blog', () {}),
          _buildMenuOption(Icons.business, 'Para su Empresa', () {}),
          _buildMenuOption(Icons.healing, 'Soy Paciente', () {}),
          ListTile(
            title: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(),
              child: Text('Entrar'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuOption(IconData icon, String text, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(text),
      onTap: onTap,
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Buscar',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFF00796B), width: 2),
        ),
      ),
    );
  }

  Widget _buildCategoryTags() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTag('Práctico', Colors.teal),
        _buildTag('Seguro', Colors.teal),
        _buildTag('Económico', Colors.tealAccent),
        _buildTag('Testimonios', Colors.tealAccent),
      ],
    );
  }

  Widget _buildTag(String text, Color color) {
    return Chip(
      label: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: color,
    );
  }

  Widget _buildMainTitle() {
    return Text(
      'COMO FUNCIONA LA TERAPIA',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xFF00796B), // Mismo color que el AppBar
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      'A cualquier hora, en cualquier lugar\n'
      'Agenda una cita en línea desde tu dispositivo. '
      'Podrás hacerlo desde la comodidad de tu casa o donde te encuentres. '
      'No te preocupes por lidiar con el tránsito o la falta de tiempo. '
      'Con PSYALIVE, puedes agendar tu teleconsulta en horarios fuera del trabajo, estudios o cuando lo desees.',
      style: TextStyle(fontSize: 16),
    );
  }

  Widget _buildTherapyCards() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildTherapyCard(
                'Terapia de parejas',
                'Con la terapia de pareja online, usted identifica problemas en la relación con profesionales cualificados.',
                Color(0xFF00796B), // Color verde oscuro
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _buildTherapyCard(
                'Programa de bienestar empresarial',
                'Con la terapia online, usted identifica problemas en la relación con profesionales cualificados.',
                Color(0xFF004D40), // Color verde más oscuro
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        _buildTherapyCard(
          'Teleconsulta para niños y adolescentes',
          'Un tipo de terapia que se puede encontrar es dirigido a niños, niñas y adolescentes. Quienes deben tener la autorización de un adulto responsable.',
          Color(0xFF00796B), // Color verde oscuro
        ),
      ],
    );
  }

  Widget _buildTherapyCard(String title, String description, Color color) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  void _showChatBubble(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          height: 300,
          child: Column(
            children: [
              Text(
                'Chat',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00796B), // Color verde oscuro
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    _buildChatBubble('Hola, ¿cómo puedo ayudarte hoy?', true),
                    _buildChatBubble(
                        'Tengo algunas preguntas sobre la terapia.', false),
                    _buildChatBubble(
                        'Claro, estaré encantado de ayudarte.', true),
                    // Agregar más burbujas aquí
                  ],
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Escribe un mensaje...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: Icon(Icons.send),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildChatBubble(String text, bool isSent) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        margin: EdgeInsets.symmetric(vertical: 4.0),
        decoration: BoxDecoration(
          color: isSent ? Color(0xFF00796B) : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSent ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
