package mypackage;

import java.time.LocalDate;

public class Task {

    private String titre;
    private String description;
    private LocalDate dateEcheance;
    private boolean terminee;

    // Constructeur
    public Task(String titre, String description, LocalDate dateEcheance) {
        this.titre = titre;
        this.description = description;
        this.dateEcheance = dateEcheance;
        this.terminee = false;
    }

    // Getters
    public String getTitre() { return titre; }
    public String getDescription() { return description; }
    public LocalDate getDateEcheance() { return dateEcheance; }
    public boolean isTerminee() { return terminee; }

    // Setters
    public void setTitre(String titre) { this.titre = titre; }
    public void setDescription(String description) { this.description = description; }
    public void setDateEcheance(LocalDate dateEcheance) { this.dateEcheance = dateEcheance; }
    public void setTerminee(boolean terminee) { this.terminee = terminee; }
}
