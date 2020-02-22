<div class="row justify-content-around" id="content">

</div>

<script>
    const content = document.getElementById('content')

    fetch('controller/listaProdutos.php', {
        method: 'GET',
        headers: {
            'Content-Type': 'text/plain;charset=UTF-8'
        },
    }).then(response => {
        return response.json();
    }).then(lista => {
        lista.map((f) => {
            let prod = `
            <div class="col my-4">
            <div class="card shadow" style="width: 18rem;">
                <img src="./storage/${f.img}" class="card-img-top" alt="...">
                <div class="card-body">
                <h5 class="card-title">${f.produto}</h5>
                <p class="card-text">${f.descricao}</p>
                <a href="#" class="btn btn-primary">Adicionar ao carrinho</a>
                </div>
            </div>
            </div>
            `
            content.innerHTML += prod
        })
    })
</script>