<%-- 
    Document   : index
    Created on : 20/03/2024, 8:21:45?a.?m.
    Author     : Sistemas
--%>


<%@include file= "templates/header.jsp" %>

<style>
    body {
        background-color: #e8f0f8; /* Light gray-blue base color */
        background-image: linear-gradient(
            45deg,
            rgba(224, 232, 240, 0.3) 25%, /* Lighter, semi-transparent gray-blue band */
            rgba(180, 200, 220, 0.5) 50%, /* Stronger, semi-transparent water-green band */
            rgba(224, 232, 240, 0.3) 75%, /* Lighter, semi-transparent gray-blue band */
            transparent 75%
            );
        background-size: 40px 40px; /* Larger texture for a more pronounced effect */
        animation: gradient 5s linear infinite; /* Smooth animation */
    }
    @keyframes gradient {
        0% {
            background-position: 0 0;
        }
        100% {
            background-position: -40px -40px;
        }
    }

    /* You can add custom styles here, for example: */
    .card {
        border-radius: 10px; /* Rounded corners */
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2); /* Subtle shadow */
    }

    .btn-primary {
        background-color: #007bff; /* Adjust button color if desired */
    }
</style>


<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card bg-dark text-light p-3">
      <h1 class="text-center">Formulario</h1>
      <form action="SvAgregar" method="POST">
        <div class="form-group">
          <label for="marca" class="text-light">Marca</label>
          <input type="text" name="marcas" class="form-control" id="marca">
        </div>
        <div class="text-center">
          <input type="submit" value="Agregar" class="btn btn-primary">
        </div>
      </form>
    </div>
</div>

<%@include file= "templates/footer.jsp" %>
