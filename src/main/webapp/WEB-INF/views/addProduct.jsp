<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page isELIgnored="false" %>
	<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<%@ include file="./base.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value='/resources/css/addProduct.css' />">
<title>Add Your Product</title>


</head>

<body>

	<div class="container">

		<div class="card product-card">

			<div class="card-header">
				<h2 class="mb-0">Add Your Product</h2>
				<small>Enter your product details</small>
			</div>

			<div class="card-body p-4">

				<form action="saveProduct" method="post">

					<!-- Product Name -->
					<div class="mb-3">
						<label for="title" class="form-label"> Product Name </label> <input
							type="text" class="form-control" id="title" name="title"
							placeholder="Enter product name" required>
					</div>


					<!-- Description -->
					<div class="mb-3">

						<label for="description" class="form-label"> Description </label>

						<textarea class="form-control" id="description" name="description"
							rows="4" maxlength="100"
							placeholder="Enter product description (maximum 100 characters)"
							required></textarea>

						<div class="form-text">Maximum 100 characters.</div>

					</div>


					<!-- Price -->
					<div class="mb-4">

						<label for="price" class="form-label"> Price </label>

						<div class="input-group">

							<span class="input-group-text">₹</span> <input type="number"
								class="form-control" id="price" name="price"
								placeholder="Enter price" min="0" step="0.01" required>

						</div>

					</div>


					<!-- Submit -->
					<button type="submit" class="btn btn-primary submit-btn">

						Add Product</button>

				</form>

			</div>

		</div>

	</div>

</body>
</html>
