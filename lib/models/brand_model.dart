class Brand {
  final String id;
  final String name;
  final String logo;

  Brand({required this.id, required this.name, required this.logo});
}

final List<Brand> brands = [
  Brand(id: '1', name: 'Adidas', logo: 'assets/images/brands/logo_adidas.png'),
  Brand(id: '2', name: 'Nike', logo: 'assets/images/brands/logo_nike.png'),
  Brand(id: '3', name: 'Fila', logo: 'assets/images/brands/logo_fila.png'),
  Brand(id: '4', name: 'Puma', logo: 'assets/images/brands/logo_puma.png'),
];
