package com.rentmanagement.controller;

import com.rentmanagement.beans.LogoBeanI;
import com.rentmanagement.common.Helper;
import com.rentmanagement.common.JLogger;
import com.rentmanagement.model.*;

import javax.ejb.EJB;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.Blob;
import java.sql.SQLException;

@WebServlet(name = "LogoController", urlPatterns = { "/logos/*" })
@MultipartConfig
public class LogoController extends BaseServlet implements Serializable {

	com.rentmanagement.common.JLogger JLogger = new JLogger(this.getClass());


	Helper helper = new Helper();
	
	private final String LOGO_DIR = "LOGO";
	
	public LogoController() {
		
		}

	private static final long serialVersionUID = 1L;
	@EJB
	LogoBeanI logoBeanI;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/* configuring the http headers */
		response.addHeader("X-XSS-Protection", "1; mode=block");
		response.addHeader("X-Frame-Options", "DENY");
		response.addHeader("X-Content-Type-Options", "nosniff");
		
		Logo lg = logoBeanI.findById(helper.toLong(request.getPathInfo().substring(1)));

			try {
				String fileName = lg.getName();

				Blob blob = lg.getImage();
				InputStream inputstream = blob.getBinaryStream();
				int fileLength = inputstream.available();

				System.out.println("Name: "+fileName+"Filelength = " + fileLength);

				ServletContext context = getServletContext();

				String mimeType = context.getMimeType(fileName);
				if(mimeType == null) {
					mimeType = "application/octet-stream";
				}

				response.setContentType(mimeType);
				response.setContentLength(fileLength);
				response.setHeader("Content-Length", String.valueOf(fileLength));
				response.setHeader("Content-disposition","inline;filename=" + fileName);

				String fullpath = request.getServletContext().getRealPath("");
				String savePath = fullpath + File.separator + LOGO_DIR;
				System.out.println("full path is:" + savePath);
				File fileSaveDir = new File(savePath);
				if (!fileSaveDir.exists()) {
					fileSaveDir.mkdir();
				}
				savePath = fullpath + File.separator + LOGO_DIR + File.separator + fileName;

				File file = new File(savePath);

				OutputStream fileoutput = response.getOutputStream();
				//FileOutputStream fileoutput = new FileOutputStream(file);
				//int read = 0;
				byte[] buffer = new byte[4096];
				while ((fileLength = inputstream.read(buffer)) > 0) {
					fileoutput.write(buffer, 0, fileLength);
				}

				System.out.println("File is saved here =============>  " + file);


				inputstream.close();
				fileoutput.close();
			} catch (SQLException sqle) {
				sqle.printStackTrace();
			}
		
	}
}
