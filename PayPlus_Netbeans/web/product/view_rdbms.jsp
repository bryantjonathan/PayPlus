<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, models.Product"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${title}</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body style="width:95%">
        <div class="row justify-content-center" style="margin-top:13%">
            <div class="col-4">
                <table class="table table-bordered table-striped">
                    <tr>
                        <th>No.</th>
                        <th>Nama</th>
                        <th>Harga</th>
                        <th>Aksi</th>
                    </tr>
                    <%
                        ArrayList<ArrayList<Object>> prods = (ArrayList<ArrayList<Object>>)request.getAttribute("list");
                        ArrayList<Object> p = prods.get(0);
                    %>
                    <h2>Jumlah Produk : <%= p.get(0) %></h2>
                    <h2>Rata-rata harga : <%= String.format("%.1f",p.get(1)) %></h2>
            </div>
        </div
    </body>
</html>
