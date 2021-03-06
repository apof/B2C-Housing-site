package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.xml.bind.v2.schemagen.xmlschema.List;

import dao.UserDAO;
import dao.UserDAOImpl;
import model.User;

/**
 * Servlet implementation class RoomDetailServlet
 */
@WebServlet("/RoomDetailServlet")
public class RoomDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String BedsNum = (String)request.getParameter("BedsNum");
		String BathsNum = (String)request.getParameter("BathsNum");
		String BedRoomsNum = (String)request.getParameter("BedRoomsNum");
		String SquareSpace = (String)request.getParameter("SquareSpace");
		String RoomType = (String)request.getParameter("RoomType");
		String Description = (String)request.getParameter("Description");
		String MinNights = (String)request.getParameter("MinNights");
		String Lat = (String)request.getParameter("Lat");
		String Lon = (String)request.getParameter("Lon");
		String Street = (String)request.getParameter("Street");
		String Neighbourhood = (String)request.getParameter("Neighbourhood");
		String Transit = (String)request.getParameter("Transit");
		String Am = (String)request.getParameter("Am");
		String Id = (String)request.getParameter("Id");
		String host_id = (String)request.getParameter("host_id");
		String photo1 = (String)request.getParameter("photo1");
		String photo2 = (String)request.getParameter("photo2");
		String photo3 = (String)request.getParameter("photo3");
		String photo4 = (String)request.getParameter("photo4");

		UserDAO dao = new UserDAOImpl();
		User host = dao.find(Integer.parseInt(host_id));
		
		request.setAttribute("BedsNum",BedsNum );
		request.setAttribute("BathsNum",BathsNum );
		request.setAttribute("BedRoomsNum",BedRoomsNum );
		request.setAttribute("SquareSpace",SquareSpace );
		request.setAttribute("RoomType",RoomType );
		request.setAttribute("Description",Description );
		request.setAttribute("MinNights",MinNights );
		request.setAttribute("Lat",Lat );
		request.setAttribute("Lon",Lon );
		request.setAttribute("Street",Street );
		request.setAttribute("Neighbourhood",Neighbourhood );
		request.setAttribute("Transit",Transit );
		request.setAttribute("Id",Id );
		request.setAttribute("Am",Am);
		request.setAttribute("host_username",host.getUsername());
		request.setAttribute("photo1",photo1);
		request.setAttribute("photo2",photo2);
		request.setAttribute("photo3",photo3);
		request.setAttribute("photo4",photo4);

		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("logedInUser");
		
		//there is loged in user
		if(user != null)
		{
			if(user.getHasReview() != -1)
			{
				//update user's click vector
				int []user_vector = (int[])session.getAttribute("user_vector");
				int []property_index = (int[])session.getAttribute("property_index");
				int propertyId = Integer.parseInt(Id);
				int i;
				for(i=0;i<1593;i++)
				{
					if(property_index[i] == propertyId) 
					{
						user_vector[i] = 1;
						break;
					}
				}
				session.setAttribute("user_vector", user_vector);			
			}
			RequestDispatcher disp = getServletContext().getRequestDispatcher("/room-details.jsp");
			disp.forward(request, response);
		}
		else
		{
			RequestDispatcher disp = getServletContext().getRequestDispatcher("/room-details-unonymous.jsp");
			disp.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
