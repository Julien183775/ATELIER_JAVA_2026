package mypackage;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class TaskServlet extends HttpServlet {

    @Override
    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();

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

            if (titre != null && !titre.trim().isEmpty()
                    && description != null && !description.trim().isEmpty()
                    && dateStr != null && !dateStr.isEmpty()) {
                LocalDate date = LocalDate.parse(dateStr);
                taches.add(new Task(titre.trim(), description.trim(), date));
            }
        }

        if ("supprimer".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            if (index >= 0 && index < taches.size()) {
                taches.remove(index);
            }
        }

        if ("terminer".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            if (index >= 0 && index < taches.size()) {
                taches.get(index).setTerminee(true);
            }
        }

        response.sendRedirect(request.getContextPath() + "/taches.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/taches.jsp");
    }
}
