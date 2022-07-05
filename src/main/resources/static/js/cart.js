function addCart(param){
	return fetch('/cart/create',{
        method: 'post',
        body: JSON.stringify(param),
        headers: {'Content-Type': "application/json; charset=utf-8"}
        })
        .then(response => response.text())
        .catch(console.log);
}
