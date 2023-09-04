List<String> getPrice(int price) {
  String a;
  String b;
  List<String> newPrice = [];

  a = price.toString();
  b = price.toString();
  if (a.length == 6) {
    a = a.substring(0, 3);
    b = b.substring(3);

    newPrice.add(a);
    newPrice.add(b);
  } else if (a.length == 4) {
    a = a.substring(0, 1);
    b = b.substring(1);

    newPrice.add(a);
    newPrice.add(b);
  } else if (a.length == 3) {
    newPrice.add(a);
  } else if (a.length == 7) {
    final i = a.substring(0, 1);

    a = a.substring(1, 4);
    b = b.substring(4);

    newPrice.add(i);
    newPrice.add(a);

    newPrice.add(b);
  }
  return newPrice;
}
