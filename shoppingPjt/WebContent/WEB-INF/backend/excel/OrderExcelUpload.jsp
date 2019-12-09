<%@page import="shopping.database.dto.ItemDTO"%>
<%@page import="shopping.database.dao.ItemDAO"%>
<%@page import="org.apache.poi.ss.util.CellRangeAddress"%>
<%@page import="org.apache.poi.ss.usermodel.Font"%>
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
		ArrayList<String[]> list = (ArrayList<String[]>) request.getAttribute("list");

		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("주문 목록");
		//Sheet명 설정
		sheet.addMergedRegion(new CellRangeAddress(0, (short) 0, 0, (short) list.get(0).length - 1));
		CellStyle topStyle = workbook.createCellStyle();
		topStyle.setBorderTop(BorderStyle.MEDIUM);
		topStyle.setBorderBottom(BorderStyle.MEDIUM);
		topStyle.setBorderLeft(BorderStyle.MEDIUM);
		topStyle.setBorderRight(BorderStyle.MEDIUM);
		topStyle.setFillForegroundColor(HSSFColorPredefined.PINK.getIndex());
		topStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		topStyle.setAlignment(HorizontalAlignment.CENTER);

		Font topFont = workbook.createFont();
		topFont.setFontHeightInPoints((short) 20);
		topStyle.setFont(topFont);

		CellStyle headStyle = workbook.createCellStyle();
		// 가는 경계선을 가집니다.
		headStyle.setBorderTop(BorderStyle.THIN);
		headStyle.setBorderBottom(BorderStyle.THIN);
		headStyle.setBorderLeft(BorderStyle.THIN);
		headStyle.setBorderRight(BorderStyle.THIN);

		Font font = workbook.createFont();
		font.setFontHeightInPoints((short) 14);
		headStyle.setFont(font);

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
		cell = row.createCell(0);
		cell.setCellStyle(topStyle);
		cell.setCellValue("주문 리스트");
		row.setHeight((short) 600);
		row = sheet.createRow(1);
		for (int i = 0; i < list.get(0).length; i++) {
			sheet.setColumnWidth(i, 6000);
			cell = row.createCell(i);
			cell.setCellStyle(headStyle);
			cell.setCellValue(list.get(0)[i]);
		}
		row.setHeight((short) 500);
		for (int i = 0; i < list.size() - 1; i++) {
			row = sheet.createRow(i + 2);
			for (int j = 0; j < list.get(0).length; j++) {
				row.createCell(j).setCellValue(list.get(i+1)[j]);
			}
		}
		out.clear();
		out = pageContext.pushBody();
		OutputStream xlsOut = response.getOutputStream();
		workbook.write(xlsOut);
		xlsOut.close();
	%>
</body>
</html>