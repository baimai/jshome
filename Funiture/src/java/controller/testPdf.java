/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.IOException;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.LineSeparator;
import java.util.ArrayList;
import model.Database;
import model.catalogTable;
import model.entity.catalogEntity;
import model.entity.companyMasterEntity;
import model.entity.productDetailMasterEntity;

/**
 *
 * @author Achilles
 */
public class testPdf extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("utf-8");
        Document document = new Document(PageSize.A4, 30, 30, 30, 30);
        try {
            int Company_Id = (Integer) getServletContext().getAttribute("Company_Id");
            Database db = new Database();
            catalogTable cat = new catalogTable(db);
            catalogEntity ca = new catalogEntity();
            ca.setCompanyId(Company_Id);
            ca.setCatalogName(request.getParameter("linkName"));
            ca.setCatalogPicLoc("upload/catalog/" + request.getParameter("fileName") + ".pdf");

            String productGroup = "", picCode = "";
            if (request.getParameter("productGroup") != null) {
                productGroup = request.getParameter("productGroup");
            }
            if (request.getParameter("picCode") != null) {
                picCode = request.getParameter("picCode");
            }
            ArrayList list = cat.search(productGroup, picCode);
            ArrayList list2 = cat.searchDetail(Company_Id);
            companyMasterEntity com = (companyMasterEntity) list2.get(0);
            //LOGO Header
            out.print(com.getCompanyCatalogLoc());
            String relativeWebPath = com.getCompanyCatalogLoc();
            String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
            String RESULT = getServletContext().getRealPath("upload/catalog") + "/" + request.getParameter("fileName") + ".pdf";
            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(RESULT));
            writer.setCompressionLevel(0);
            document.open();
            Image img = Image.getInstance(absoluteDiskPath);
            img.setAbsolutePosition(0, 0);
            img.scaleAbsoluteHeight(842);
            img.scaleAbsoluteWidth(595);
            writer.getDirectContent().addImage(img);
            document.newPage();
            //
            String relativeWebPath3 = com.getCompanyLogoLoc();
            String absoluteDiskPath3 = getServletContext().getRealPath(relativeWebPath3);
            Image img3 = Image.getInstance(absoluteDiskPath3);
            img3.setAbsolutePosition(40,760);
            img3.scaleAbsoluteHeight(45);
            img3.scaleAbsoluteWidth(70);
            writer.getDirectContent().addImage(img3);
            //
            BaseFont bfComic = BaseFont.createFont("c:\\windows\\fonts\\ANGSA.TTF", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
            Font font = new Font(bfComic, 12);
            PdfPCell cellh;
            PdfPTable tablehead = new PdfPTable(20);
            tablehead.setWidthPercentage(100);
            cellh = new PdfPCell(new Paragraph("ลำดับ", font));
            cellh.setBackgroundColor(BaseColor.LIGHT_GRAY);
            cellh.setColspan(1);
            tablehead.addCell(cellh);
            cellh = new PdfPCell(new Paragraph("", font));
            cellh.setBackgroundColor(BaseColor.LIGHT_GRAY);
            cellh.setColspan(5);
            tablehead.addCell(cellh);
            cellh = new PdfPCell(new Paragraph("ชื่อสินค้า", font));
            cellh.setBackgroundColor(BaseColor.LIGHT_GRAY);
            cellh.setColspan(3);
            tablehead.addCell(cellh);
            cellh = new PdfPCell(new Paragraph("รหัสสินค้า", font));
            cellh.setBackgroundColor(BaseColor.LIGHT_GRAY);
            cellh.setColspan(3);
            tablehead.addCell(cellh);
            cellh = new PdfPCell(new Paragraph("รายละอียด", font));
            cellh.setBackgroundColor(BaseColor.LIGHT_GRAY);
            cellh.setColspan(6);
            tablehead.addCell(cellh);
            cellh = new PdfPCell(new Paragraph("ราคา", font));
            cellh.setBackgroundColor(BaseColor.LIGHT_GRAY);
            cellh.setColspan(2);
            tablehead.addCell(cellh);
            //
            PdfPTable tableCom = new PdfPTable(1);
            tableCom.setWidthPercentage(100);
            PdfPCell cellCom;
            Font font2 = new Font(bfComic, 24, 2, BaseColor.BLUE);
            cellCom = new PdfPCell(new Paragraph("แคตตาล็อคออนไลน์", font2));
            cellCom.setBorder(0);
            cellCom.setHorizontalAlignment(cellCom.ALIGN_CENTER);
            tableCom.addCell(cellCom);

            font2 = new Font(bfComic, 18, 2, BaseColor.BLACK);
            cellCom = new PdfPCell(new Paragraph(com.getCompanyNameT(), font2));
            cellCom.setBorder(0);
            cellCom.setHorizontalAlignment(cellCom.ALIGN_CENTER);
            tableCom.addCell(cellCom);

            font2 = new Font(bfComic, 15, 2, BaseColor.BLACK);
            cellCom = new PdfPCell(new Paragraph(com.getCompanyAddrT(), font2));
            cellCom.setBorder(0);
            cellCom.setHorizontalAlignment(cellCom.ALIGN_CENTER);
            tableCom.addCell(cellCom);

            font2 = new Font(bfComic, 18, 2, BaseColor.BLACK);
            cellCom = new PdfPCell(new Paragraph(com.getCompanyTel1() + "   " + com.getCompanyFax1() + "   " + com.getCompanyEmail1(), font2));
            cellCom.setBorder(0);
            cellCom.setHorizontalAlignment(cellCom.ALIGN_CENTER);
            tableCom.addCell(cellCom);

            font2 = new Font(bfComic, 18, 2, BaseColor.BLACK);
            cellCom = new PdfPCell(new Paragraph("_________________________________________________________________________________________", font2));
            cellCom.setBorder(0);
            cellCom.setHorizontalAlignment(cellCom.ALIGN_CENTER);
            tableCom.addCell(cellCom);

            font2 = new Font(bfComic, 16, 2, BaseColor.BLACK);
            cellCom = new PdfPCell(new Paragraph("หมวดสินค้า : "+request.getParameter("groupName"), font2));
            cellCom.setBorder(0);
            cellCom.setHorizontalAlignment(cellCom.ALIGN_LEFT);
            tableCom.addCell(cellCom);

            cellCom = new PdfPCell(new Paragraph("", font2));
            cellCom.setBorder(Rectangle.BOTTOM);
            tableCom.addCell(cellCom);


            document.add(tableCom);


            LineSeparator ls = new LineSeparator();
            document.add(new Chunk(ls));
            document.add(new Chunk(ls));
            document.add(new Chunk(ls));
            document.add(new Chunk(ls));
            document.add(tablehead);

            for (int i = 0; i < list.size(); i++) {
                PdfPTable table = new PdfPTable(20);
                PdfPCell cell;
                table.setWidthPercentage(100);
                productDetailMasterEntity pdm = (productDetailMasterEntity) list.get(i);
                String relativeWebPath2 = pdm.getProductDPicLoc();
                String absoluteDiskPath2 = getServletContext().getRealPath(relativeWebPath2);
                Image img2 = Image.getInstance(absoluteDiskPath2);
                img2.scaleAbsoluteHeight(90);
                img2.scaleAbsoluteWidth(130);

                if (i == 6) {
                    document.newPage();
                    document.add(tablehead);
                }
                if (i > 6 && (i - 6) % 7 == 0) {
                    document.newPage();
                    document.add(tablehead);
                }


                cell = new PdfPCell(new Paragraph(i + 1 + " ", font));
                cell.setColspan(1);
                cell.setRowspan(6);
                cell.setHorizontalAlignment(cell.ALIGN_CENTER);
                table.addCell(cell);

                cell = new PdfPCell(img2, true);
                cell.setColspan(5);
                cell.setRowspan(6);
                cell.setVerticalAlignment(cell.ALIGN_MIDDLE);
                table.addCell(cell);

                cell = new PdfPCell(new Paragraph(pdm.getProductDNameT() + " ", font));
                cell.setColspan(3);
                cell.setRowspan(6);
                table.addCell(cell);

                cell = new PdfPCell(new Paragraph(pdm.getProductCode() + " ", font));
                cell.setColspan(3);
                cell.setRowspan(6);
                table.addCell(cell);
                ////
                cell = new PdfPCell(new Paragraph(pdm.getProductSpect1_T(), font));
                cell.setColspan(6);
                cell.setRowspan(1);
                cell.setBorder(Rectangle.ALIGN_TOP);
                table.addCell(cell);
                ////
                cell = new PdfPCell(new Paragraph(pdm.getProductPrice1() + " ", font));
                cell.setColspan(2);
                cell.setRowspan(6);
                table.addCell(cell);

                cell = new PdfPCell(new Paragraph(pdm.getProductSpect2_T(), font));
                cell.setColspan(6);
                cell.setRowspan(1);
                cell.setBorder(Rectangle.ALIGN_TOP);
                table.addCell(cell);

                cell = new PdfPCell(new Paragraph(pdm.getProductSpect3_T(), font));
                cell.setColspan(6);
                cell.setRowspan(1);
                cell.setBorder(Rectangle.ALIGN_TOP);
                table.addCell(cell);

                cell = new PdfPCell(new Paragraph(pdm.getProductSpect4_T(), font));
                cell.setColspan(6);
                cell.setRowspan(1);
                cell.setBorder(Rectangle.ALIGN_TOP);
                table.addCell(cell);

                cell = new PdfPCell(new Paragraph(pdm.getProductSpect5_T(), font));
                cell.setColspan(6);
                cell.setRowspan(1);
                cell.setBorder(Rectangle.ALIGN_TOP);
                table.addCell(cell);

                cell = new PdfPCell(new Paragraph(pdm.getProductSpect6_T(), font));
                cell.setColspan(6);
                cell.setRowspan(1);
                cell.setBorder(Rectangle.ALIGN_TOP);
                 cell.setBorder(Rectangle.BOTTOM);
                table.addCell(cell);
                table.completeRow();
                document.add(table);

            }
            cat.add(ca);
            db.close();
            document.close();
            response.sendRedirect("catalogSetup.jsp");

        } catch (Exception ex) {
            ex.printStackTrace(out);
            document.close();
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
