<%-- 
    Document   : categoria
    Created on : 05/01/2020, 10:33:05 PM
    Author     : jbustillos
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!-- librería Tag Security -->
<%@taglib prefix="security" 
          uri="http://www.springframework.org/security/tags"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <head>
       <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <title>LISTA DE CATEGORIA</title>
 
        <!-- Bootstrap core CSS -->
        <link href="resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!--external css-->
        <link href="resources/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <!-- Custom styles for this template -->
        <link href="resources/css/style.css" rel="stylesheet">
        <link href="resources/css/style-responsive.css" rel="stylesheet">
    </head>
    </head>
    <body>
         <section id="container">

    <header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
      <!--logo start-->
      <a href="index.html" class="logo"><b>MY<span>MARKET</span></b></a>
      <!--logo end-->
      
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <li><a class="logout" href="login.html">Logout</a></li>
        </ul>
      </div>
    </header>
            <security:authentication var="username" 
                                 property="principal.username"/>
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered"><a href="#"><img src="resources/images/user21.JPG" class="img-circle" width="80"></a></p>
          <h5 class="centered">${username}</h5>
          <li class="mt">
            <a class="active" href="index.html">
              <i class="fa fa-dashboard"></i>
              <span>INICIO</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-desktop"></i>
              <span>MANTENIMIENTO</span>
              </a>
            <ul class="sub">
              <li><a href="producto">PRODUCTO</a></li>
              <li><a href="marca">MARCA</a></li>
              <li><a href="categoria">CATEGORIA</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-cogs"></i>
              <span>VENTA</span>
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
              <li><a href="detalleCompra">DETALLE COMPRA</a></li>
            </ul>
          </li>
        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
    
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-angle-right"></i> MANTENIMIENTO DE MARCAS</h3>
        <div class="row">
            <security:authentication var="username" 
                                 property="principal.username"/>
        
            Estimado(a) <b>${username}</b>; <br>
        </div>
        <!-- row -->
        <div class="row mt">
          <div class="col-md-12">
            <div class="content-panel">
              <table class="table table-striped table-advance table-hover">
                <h4><i class="fa fa-angle-right"></i>CATEGORIA</h4>
                <hr>
                <td>
                      <button class="btn btn-success btn-xs"><i class="fa fa-check"></i>  <a style="color:white" href="<c:url value='/categoria_nuevo'/>">Nuevo</a></button>
                     
                </td>
                
                  <tr>
                        <td><b>ID</b></td>
                        <td><b>Descripcion</b></td>
                        <td><b>Estado</b></td>
                        <td></td>
                        <td></td>
                
                  </tr>
                    
               
                <tbody>
                  <tr>
               <c:forEach var="key" items="${categoria}">
                    <tr>
                        <td>${key.id_categoria}</td>                    
                        <td>${key.descripcion}</td>
                        <td>${key.estado}</td>

                    <td>
                         <button class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i> 
                         <a style="color:white" href="<c:url value='/categoria_editar/${key.id_categoria}'/>">Editar</a></button>
                    </td>

                    <td> 
                        <button class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> 
                         <a style="color:white" href="<c:url value='/categoria_eliminar/${key.id_categoria}'/>">Eliminar</a></button>
                    </td>  


                    </tr>
                 </c:forEach>   
                  </tr>
                  
                  <td>
                      <button class="btn btn-success btn-xs"><i class="fa fa-check"></i>  <a style="color:white" href="<c:url value='/administrador'/>">Index</a></button>
                     
                  </td>
                  
                  
                </tbody>
                
              </table>
            </div>
            <!-- /content-panel -->
          </div>
          <!-- /col-md-12 -->
        </div>
        <!-- /row -->
      </section>
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
    <!--footer start-->
    
    <!--footer end-->
  </section>
                      
        <script src="resources/lib/jquery/jquery.min.js"></script>
        <script src="resources/lib/bootstrap/js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="resources/lib/jquery.dcjqaccordion.2.7.js"></script>
        <script src="resources/lib/jquery.scrollTo.min.js"></script>
        <script src="resources/lib/jquery.nicescroll.js" type="text/javascript"></script>
        <!--common script for all pages-->
        <script src="resources/lib/common-scripts.js"></script>

    </body>
</html>
