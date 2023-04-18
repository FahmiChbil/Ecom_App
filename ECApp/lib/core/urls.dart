String getsingleProductUrl(int id) {
  return 'https://dummyjson.com/products/$id';
}

String searchProductUrl(String product) {
  return 'https://dummyjson.com/products/search?q=$product';
}

String getProductByCategory(String categorie) {
  return 'https://dummyjson.com/products/category/$categorie';
}

String getSingleUser(int id) {
  return 'https://dummyjson.com/users/$id';
}

String getUserCart(int id) {
  return 'https://dummyjson.com/users/$id/carts';
}
