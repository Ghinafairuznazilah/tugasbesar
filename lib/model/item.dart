class Item {
  final String id;
  final String name;
  final String image;
  final String desc;
  final String alamat;
  final String harga;
  final String luas;
  final String telp;

  Item({
    this.id,
    this.name,
    this.image,
    this.desc,
    this.harga,
    this.alamat,
    this.luas,
    this.telp,

  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      desc: json['desc'],
      alamat: json['alamat'],
      harga: json['harga'],
      luas: json['luas'],
      telp: json['telp'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'desc': desc,
        'alamat': alamat,
        'harga': harga,
        'luas': luas,
        'telp': telp,
      };
}
