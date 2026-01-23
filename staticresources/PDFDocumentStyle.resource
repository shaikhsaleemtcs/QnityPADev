@page { 
	size: letter portrait;

	margin-top: 100px;
	margin-bottom: 80px;

	
	@bottom-left {
		content: element(footer_left);
	}

	@bottom-center {
		content: element(footer_center);
	}

	@bottom-right {
		content: element(footer_right);
	}
}


.footer_left {
	text-align: left;
	position: running(footer_left);
	color: #B2B2B2;
	font-size:60%;
	font-family:Times New Roman;
}

.footer_center {
	text-align: center;
	position: running(footer_center);
	color: #B2B2B2;
	font-size:60%;
	font-family:Times New Roman;
}

.footer_right {
	text-align: right;
	position: running(footer_right);
	color: #B2B2B2;
	font-size:60%;
	font-family:Times New Roman;
}

