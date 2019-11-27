<%@page import="org.apache.poi.ss.usermodel.HorizontalAlignment"%>
<%@page import="org.apache.poi.ss.usermodel.FillPatternType"%>
<%@page import="org.apache.poi.hssf.util.HSSFColor.*"%>
<%@page import="org.apache.poi.ss.usermodel.BorderStyle"%>
<%@page import="org.apache.poi.ss.usermodel.CellStyle"%>
<%@page import="java.text.SimpleDateFormat"%>


<%@ page language="java"
	contentType="APPLICATION/OCTET-STREAM;charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	Calendar cal = Calendar.getInstance();

	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");

	String nowDate = date.format(cal.getTime());

	response.setContentType("application/octet-stream");

	response.setHeader("Content-Disposition", "attachment;filename=shopping_" + nowDate + ".xls");

	response.setHeader("Content-Description", "JSP Generated Data");
%>



<%@page
	import="org.apache.poi.hssf.usermodel.*,

     java.io.FileOutputStream,java.util.*,

    java.io.*

     "%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>엑셀 POI 테스트</title>

</head>

<body>

	<%
		HSSFWorkbook workbook = new HSSFWorkbook();

		HSSFSheet sheet = workbook.createSheet("상품목록");
		//Sheet명 설정
		CellStyle headStyle = workbook.createCellStyle();
		// 가는 경계선을 가집니다.
		headStyle.setBorderTop(BorderStyle.THIN);
		headStyle.setBorderBottom(BorderStyle.THIN);
		headStyle.setBorderLeft(BorderStyle.THIN);
		headStyle.setBorderRight(BorderStyle.THIN);

		headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		headStyle.setAlignment(HorizontalAlignment.CENTER);

		CellStyle bodyStyle = workbook.createCellStyle();
		bodyStyle.setBorderTop(BorderStyle.THIN);
		bodyStyle.setBorderBottom(BorderStyle.THIN);
		bodyStyle.setBorderLeft(BorderStyle.THIN);
		bodyStyle.setBorderRight(BorderStyle.THIN);

		HSSFRow row;

		HSSFCell cell;

		row = sheet.createRow(0);

		row.createCell(0).setCellValue("상품 번호");

		row.createCell(1).setCellValue("상품");

		row.createCell(2).setCellValue("대분류");

		row.createCell(3).setCellValue("소분류");

		row.createCell(4).setCellValue("가격");

		row.createCell(5).setCellValue("대표이미지");

		row.createCell(6).setCellValue("조회수");

		row.createCell(7).setCellValue("상품 등록일");

		row.createCell(0).setCellValue(1);

		row.createCell(1).setCellValue(1);

		row.createCell(2).setCellValue(1);

		row.createCell(3).setCellValue(1);

		row.createCell(4).setCellValue(1);

		row.createCell(5).setCellValue(1);

		row.createCell(6).setCellValue(1);

		row.createCell(7).setCellValue(1);

		row.setRowStyle(bodyStyle);
		
		out.clear();

		out = pageContext.pushBody();

		OutputStream xlsOut = response.getOutputStream();

		workbook.write(xlsOut);

		xlsOut.close();
	%>



</body>

</html>