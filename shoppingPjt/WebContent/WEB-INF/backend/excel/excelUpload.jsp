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
		String[] headText = { "상품 번호", "상품 코드", "상품명", "사이즈", "색 상", "수 량", "판매상태", "원 가", "판매가/할인가", "대분류", "소분류",
				"제조사", "원산지", "등록일" };

		ItemDAO itemDAO = new ItemDAO();
		ArrayList<ItemDTO> list = itemDAO.selectItemFromExcel();
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("상품목록");
		//Sheet명 설정
		sheet.addMergedRegion(new CellRangeAddress(0, (short) 0, 0, (short) headText.length - 1));
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
		cell.setCellValue("상품 리스트");
		row.setHeight((short) 600);
		row = sheet.createRow(1);
		for (int i = 0; i < headText.length; i++) {
			sheet.setColumnWidth(i, 6000);
			cell = row.createCell(i);
			cell.setCellStyle(headStyle);
			cell.setCellValue(headText[i]);
		}
		row.setHeight((short) 500);
		for (int i = 0; i < list.size(); i++) {
			row = sheet.createRow(i + 2);
			row.createCell(0).setCellValue(list.get(i).getItemIdx());
			row.createCell(1).setCellValue(list.get(i).getItemCode());
			row.createCell(2).setCellValue(list.get(i).getItemName());
			row.createCell(3).setCellValue(list.get(i).getSize());
			row.createCell(4).setCellValue(list.get(i).getColor());
			row.createCell(5).setCellValue(list.get(i).getItemStock());
			String status = "판매 중지";
			if (list.get(i).getItemStatus() == 1)
				status = "판매 중";
			row.createCell(6).setCellValue(status);
			row.createCell(7).setCellValue(list.get(i).getItemPrice());
			row.createCell(8).setCellValue(list.get(i).getItemSalePrice());
			row.createCell(9).setCellValue(list.get(i).getCategoryName());
			row.createCell(10).setCellValue(list.get(i).getSmallCategoryName());
			row.createCell(11).setCellValue(list.get(i).getItemManufacuter());
			row.createCell(12).setCellValue(list.get(i).getItemOrigin());
			row.createCell(13).setCellValue(list.get(i).getItemDate());
		}
		out.clear();
		out = pageContext.pushBody();
		OutputStream xlsOut = response.getOutputStream();
		workbook.write(xlsOut);
		xlsOut.close();
	%>
</body>
</html>