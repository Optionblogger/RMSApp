package com.rentmanagement.common;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;

import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

public class ExcellExtractor implements java.io.Serializable  {
    private static int cols = 50;

    public  ExcellExtractor(){

    }


    public static List<Vector<String>> extract(File file, int startRow, Integer... sheetNumber) {
        Integer sheetNo =0;
        for (Integer sh : sheetNumber) {
            sheetNo = sh.intValue();
        }
        if(sheetNo == null)
            sheetNo = 0;
        List<Vector<String>> res = new ArrayList<Vector<String>>();
        InputStream inputStream = null;
        try {
            inputStream = new FileInputStream(file);
        } catch (FileNotFoundException e) {
            System.out.println("File not found in the specified path.");
            e.printStackTrace();
        }

        POIFSFileSystem fileSystem = null;
        try {
            fileSystem = new POIFSFileSystem(inputStream);
            HSSFWorkbook workBook = new HSSFWorkbook(fileSystem);
            HSSFSheet sheet = workBook.getSheetAt(sheetNo);
            FormulaEvaluator fe = workBook.getCreationHelper().createFormulaEvaluator();
            Iterator<Row> rows = sheet.rowIterator();

            //objs = new Object[20];
            while (rows.hasNext()) {
                Row row = rows.next();

                // display row number in the console.
                if(row.getRowNum() < startRow) continue;
                //	System.out.println("Row No.: " + row.getRowNum());

                Vector<String> inner = new Vector<String>();
                for(int cn = 0; cn < cols; cn++ ) {
                    Cell cell = row.getCell(cn, Row.MissingCellPolicy.CREATE_NULL_AS_BLANK);
                    switch (cell.getCellType()) {
                        case HSSFCell.CELL_TYPE_NUMERIC: {
                            if(HSSFDateUtil.isCellDateFormatted(cell)){
                                DateFormat df = new SimpleDateFormat("dd-MM-yy");
                                inner.add(df.format(cell.getDateCellValue()));
                            }else{
                                inner.add(cell.getNumericCellValue() + "");
                            }
                            break;
                        }
                        case HSSFCell.CELL_TYPE_STRING: {
                            inner.add(cell.getStringCellValue().replace("\r", " ").replace("\n", " "));
                            break;
                        }
                        case HSSFCell.CELL_TYPE_FORMULA: {
                            switch (fe.evaluateFormulaCell(cell)) {
                                case Cell.CELL_TYPE_BOOLEAN:
                                    inner.add(cell.getBooleanCellValue() + "");
                                    break;
                                case Cell.CELL_TYPE_NUMERIC:
                                    if(HSSFDateUtil.isCellDateFormatted(cell)){
                                        DateFormat df = new SimpleDateFormat("dd-MM-yy");
                                        inner.add(df.format(cell.getDateCellValue()));
                                    }else{
                                        inner.add(cell.getNumericCellValue() + "");
                                    }
                                    break;
                                case Cell.CELL_TYPE_STRING:
                                    inner.add(cell.getStringCellValue());
                                    break;
                                case Cell.CELL_TYPE_BLANK:
                                    inner.add("");
                                    break;
                                case Cell.CELL_TYPE_ERROR:
                                    inner.add("");
                                    break;
                                // CELL_TYPE_FORMULA will never occur
                                case Cell.CELL_TYPE_FORMULA:
                                    break;
                            }
                            break;
                        }

                        case HSSFCell.CELL_TYPE_BLANK: {
                            inner.add("");
                            break;
                        }

                        default: {
                            inner.add("");
                            break;
                        }
                    }
                }
                res.add(inner);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return res;
    }
}
