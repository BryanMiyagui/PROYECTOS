<%-- 
    Document   : producto_nuevo
    Created on : 10/01/2020, 08:34:43 PM
    Author     : jbustillos
--%>
<!-- libreria Spring Form -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Registrar Productos</title>
        <!-- Bootstrap core CSS -->
        <link href="resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!--external css-->
        <link href="resources/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <!-- Custom styles for this template -->
        <link href="resources/css/style.css" rel="stylesheet">
       
    </head>
  <body>
     
    <header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
      <a href="index.html" class="logo"><b>MI<span>MARKET</span></b></a>
      <div class="nav notify-row" id="top_menu">
      </div>
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <li><a class="logout" href="login.html">Iniciar Sesión</a></li>
        </ul>
      </div>
    </header>
    <aside>
      <div id="sidebar" class="nav-collapse">
        <ul class="sidebar-menu" id="nav-accordion">
          <br>
          <p class="centered"><a href=""><img src="resources/images/user21.JPG" width="200"></a></p><br>
          <li class="mt">
            <a class="active" href="index.jsp">
              <i class="fa fa-dashboard"></i>
              <span>Menu Principal</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-cog"></i>
              <span>Mantenimientos</span>
              </a>
                <ul class="sub">
                    <li><a href="roles">ROL</a></li>
                    <li><a href="usuario">USUARIO</a></li>
                    <li><a href="cliente">CLIENTE</a></li>
                    <li><a href="proveedor">PROVEEDOR</a></li>
                    <li><a href="producto">PRODUCTO</a></li>
                    <li><a href="marca">MARCA</a></li>
                    <li><a href="categoria">CATEGORIA</a></li>
                    <li><a href="tipoDocumento">TIPO DOCUMENTO</a></li>
                </ul>
          </li>
          
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-shopping-bag"></i>
              <span>Venta</span>
              </a>
              <ul class="sub">
              <li><a href="venta">DETALLE VENTA</a></li>
              </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-book"></i>
              <span>COMPRA</span>
            </a>
            <ul class="sub">
              <li><a href="compra">COMPRA</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </aside>
 
    <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i>Registro de Productos</h3>
            <div class="form-panel">
                <br>
              <form:form name="" method="post" modelAttribute="producto" style="padding: 20px" class="form-horizontal style-form">
             
             ${dfecha}
            <div class="form-group">
                   <label class="control-label col-md-3">Codigo producto:</label>
                   <div class="col-md-3 col-xs-11">
                    <form:input type="text" path="id_producto" required="" class="form-control" size="20" maxlength="12" /> 
                   </div>
             </div>
            <div class="form-group">
                   <label class="control-label col-md-3">Nombre:</label>
                   <div class="col-md-3 col-xs-11">
                    <form:input type="text" path="nombre" required="" class="form-control" size="20" maxlength="64" /> 
                   </div>
            </div>
                   
            <div class="form-group">
                   <label class="control-label col-md-3">Presentación:</label>
                   <div class="col-md-3 col-xs-11">
                    <form:select path="unidadMedida" required="" class="form-control" maxlength="20" >
                        <form:option value="caja">Caja</form:option>
                        <form:option value="bolsa">Bolsa</form:option>
                        <form:option value="botella">Botella</form:option>
                         <form:option value="unidad">Unidad</form:option>
                        <form:option value="Kg">Kilos</form:option>
                        <form:option value="Gramos">Gramos</form:option>
                    </form:select>
                    </div>
            </div>
                   
                     
            <div class="form-group">
               <label class="control-label col-md-3">Precio:</label>
               <div class="col-md-3 col-xs-11">
                <form:input type="number" path="precio" required="" class="form-control" size="20" maxlength="20"  step="0.01" min="0"/> 
               </div>
            </div>
            <div class="form-group">
                   <label class="control-label col-md-3">Categoria:</label>
                   <div class="col-md-3 col-xs-11">
                    <form:select path="categoria.id_categoria" class="form-control"
                                             items="${lstcategoria}" 
                                             itemValue="id_categoria" 
                                             itemLabel="descripcion"> 
                    </form:select>                    
                   </div>
            </div>
            <div class="form-group">
                   <label class="control-label col-md-3">Marca:</label>
                   <div class="col-md-3 col-xs-11">
                    <form:select path="marca.id_marca" class="form-control"
                         items="${lstmarca}" 
                         itemValue="id_marca" 
                         itemLabel="descripcion"> 
                    </form:select> 
                   </div>
            </div>
            <button type="submit" class="btn btn-success btn-xs">Guardar</button>
            <button type="button" class="btn btn-danger btn-xs" onclick="location.href='<c:url value="/producto"/>'">Cancelar</button>           
        </form:form>
            </div>
      </section>
  </section>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="resources/lib/jquery/jquery.min.js"></script>
  <script src="resources/lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="resources/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="resources/lib/jquery.scrollTo.min.js"></script>
  <script src="resources/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <!--common script for all pages-->
  <script src="resources/lib/common-scripts.js"></script>
  <!--script for this page-->
  <script src="resources/lib/form-validation-script.js"></script>
  </body>
</html>
