<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./base.jsp"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href='<c:url value="/resources/css/dashboard.css"></c:url>'>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>My Products</title>
</head>

<body>
	<div class="container">

		<!-- Header -->
		<div class="page-header text-center">

			<h1 class="page-title">My Products</h1>

			<p class="page-subtitle">Manage all your products from one place
			</p>

		</div>
		
		<div class="container" style="text-align: center; margin-bottom: 10px;" >
		<a href='<c:url value="/"></c:url>'  class="btn btn-primary">Home Page</a>
		</div>

		<c:if test="${param.delMsg == 'true' }">
			<script>alert("Product is deleted Successfully")</script>
			<%
			response.sendRedirect(request.getContextPath() + "/dashboard");
			%>
		</c:if>

		<!-- Products -->
		<div class="row g-4">
			<c:forEach var="product" items="${allProducts}">

				<div class="col-12 col-md-6 col-lg-4">

					<div class="product-card p-4">

						<!-- Product ID -->
						<h1>
							<span class="product-id"> ID: ${product.pid} </span>
						</h1>


						<!-- Product Title -->
						<h2 class="product-title">${product.title}</h2>


						<!-- Description -->
						<p class="product-description">${product.description}</p>


						<!-- Price -->
						<div class="product-price">₹ ${product.price}</div>


						<!-- Buttons -->
						<div class="action-buttons">

							<a href="javascript:void(0)" data-pid="${product.pid}"
								data-title="${product.title }"
								data-description="${product.description }"
								data-price="${product.price }"
								class="btn btn-warning update-btn"> Update </a> <a
								href="<c:url value='/deleteProduct/${product.pid}' />"
								class="btn btn-danger"
								onclick="return confirm('Are you sure you want to delete this product?');">
								Delete </a>
						</div>

					</div>

				</div>

			</c:forEach>

		</div>
		
		

		<!-- Hiddent Update Model to Save Chnages -->

		<div id="updateModel" class="update-modal">

			<div class="update-card">

				<!-- Header -->

				<div class="update-header">

					<h3>Update Product</h3>

					<p>Edit your product details below</p>

				</div>


				<form action="updateProduct" method="POST">

					<input type="hidden" id="updatePid" name="pid">


					<!-- Product Name -->

					<div class="update-form-group">

						<label for="updateTitle" class="update-form-label">

							Product Name </label> <input type="text" id="updateTitle" name="title"
							class="update-input" placeholder="Enter product name" required>

					</div>


					<!-- Description -->

					<div class="update-form-group">

						<label for="updateDescription" class="update-form-label">

							Description </label>

						<textarea id="updateDescription" name="description"
							class="update-textarea" rows="4" maxlength="100"
							placeholder="Enter product description" required></textarea>

						<small class="update-help-text"> Maximum 100 characters. </small>

					</div>


					<!-- Price -->

					<div class="update-form-group">

						<label for="updatePrice" class="update-form-label"> Price

						</label>

						<div class="price-container">

							<span class="price-symbol"> ₹ </span> <input type="number"
								id="updatePrice" name="price" class="price-input"
								placeholder="Enter price" min="0" step="0.01" required>

						</div>

					</div>


					<!-- Buttons -->

					<div class="update-actions">

						<button type="button" class="cancel-btn" onclick="closeModel()">

							Cancel</button>

						<button type="submit" class="save-btn">Save Changes</button>

					</div>

				</form>

			</div>

		</div>
		<!-- Script to add dynamically change the update product -->
		<script type="text/javascript">
		document.querySelectorAll(".update-btn").forEach(function(button) {

		    button.addEventListener("click", function() {

		        const pid = this.dataset.pid;
		        const title = this.dataset.title;
		        const description = this.dataset.description;
		        const price = this.dataset.price;

		        console.log("Update clicked!");
		        console.log("PID:", pid);
		        console.log("Title:", title);
		        console.log("Description:", description);
		        console.log("Price:", price);



		        document.getElementById("updatePid").value = pid;
		        document.getElementById("updateTitle").value = title;
		        document.getElementById("updateDescription").value = description;
		        document.getElementById("updatePrice").value = price;
		        
		        document.getElementById("updateModel").style.display = "flex";
		        
		    });

		});
		function closeModel(){
	        document.getElementById("updateModel").style.display = "none";
		}
		
		</script>


		<!-- No products -->
		<c:if test="${empty allProducts}">

			<div class="empty-box mt-4">

				<h3>No Products Found</h3>

				<p class="text-muted">You haven't added any products yet.</p>

				<a href="<c:url value='/addProduct' />" class="btn btn-primary">
					Add Your First Product </a>

			</div>

		</c:if>

	</div>

</body>
</html>

