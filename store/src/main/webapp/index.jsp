<%-- 
    Document   : index
    Created on : 10/04/2024, 7:21:55?a.?m.
    Author     : Sistemas
--%>

<%@include file="templates/header.jsp" %> <!-- Incluir el encabezado -->

<style>
    /* Estilos CSS personalizados */
    body {
        background-color: #e8f0f8;
        background-image: linear-gradient(
            45deg,
            rgba(224, 232, 240, 0.3) 25%,
            rgba(180, 200, 220, 0.5) 50%,
            rgba(224, 232, 240, 0.3) 75%,
            transparent 75%
            );
        background-size: 40px 40px;
        animation: gradient 5s linear infinite;
    }
    @keyframes gradient {
        0% {
            background-position: 0 0;
        }
        100% {
            background-position: -40px -40px;
        }
    }
    .card {
        border-radius: 10px;
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
    }
    .btn-primary {
        background-color: #007bff;
    }
</style>


<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card bg-dark text-light p-3">
        <h1 class="text-center">Formulario</h1>
        <form action="sv_agregarProducto" method="POST">
            <div class="form-group">
                <label for="marca" class="text-light">Marca</label>
                <input type="text" name="marcas" class="form-control" id="marca">
            </div>
            <div class="text-center">
                <input type="submit" value="conectar" class="btn btn-primary">
            </div>
        </form>
    </div>
</div>


<%@include file="templates/footer.jsp" %> <!-- Incluir el pie de página -->


