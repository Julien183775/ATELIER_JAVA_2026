package mypackage;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TaskServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Récupération ou création de la liste en session
        ArrayList<Task> taches = (ArrayList<Task>) session.getAttribute("taches");
        if (taches == null) {
            taches = new ArrayList<Task>();
            session.setAttribute("taches", taches);
        }

        String action = request.getParameter("action");

        if ("ajouter".equals(action)) {
            String titre = request.getParameter("titre");
            String description = request.getParameter("description");
            String dateStr = request.getParameter("dateEcheance");
            LocalDate date = LocalDate.parse(dateStr);
            taches.add(new Task(titre, description, date));
        }

        if ("supprimer".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            taches.remove(index);
        }

        if ("terminer".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            taches.get(index).setTerminee(true);
        }

        // Redirection vers la JSP d'affichage
        response.sendRedirect("taches.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("taches.jsp");
    }
}
