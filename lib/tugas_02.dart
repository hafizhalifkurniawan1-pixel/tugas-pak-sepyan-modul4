class Mhs {
  String nama; String id; String? email;
  Mhs(this.nama, this.id, {this.email});

  infotampilan() {
    print("NIM: $id-Nama: $nama-Email: ${email ?? 'Email tidak tersedia'}");
  }
}

void main() {
  var Mhs1 = Mhs("Hafizh", "362558302147",email: "dimas@gmail.com");
  var Mhs2 = Mhs("Hafizh", "362558302147");


  Mhs1.infotampilan();
  Mhs2.infotampilan();
}