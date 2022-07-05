console.log("*****Review Module........");
function getList(param) {
	     let contentsno = param.contentsno;
         let sno = param.sno;
         let eno = param.eno;
        return fetch(`/review/list/${contentsno}/${sno}/${eno}`,{method:'get'}) 
              .then(response => response.json())
              .catch(console.log)
}

function getPage(param) {
	    let url = `/review/page?${param}`;
		console.log(url);
        return fetch(url,{method : 'get'})
              .then(response => response.text())
              .catch(console.log)

}
    
function add(reply) {
        return fetch('/review/create',{
                method: 'post',
                body: JSON.stringify(reply),
                headers: {'Content-Type': "application/json; charset=utf-8"}
                })
                .then(response => response.json())
                .catch(console.log);
}
 
function get(rnum) {
        return fetch(`/review/${rnum}`,{method: 'get'})
               .then(response => response.json())
               .catch(console.log);
}
    
function update(reply) {
        return fetch('/review/',{
                method: 'put',
                body: JSON.stringify(reply),
                headers: {'Content-Type': "application/json; charset=utf-8"}
                })
               .then(response => response.text())
               .catch(console.log);
}

function remove(rnum) {
        return fetch(`/review/${rnum}`,{method: 'delete'})
               .then(response => response.text())
               .catch(console.log);
}
