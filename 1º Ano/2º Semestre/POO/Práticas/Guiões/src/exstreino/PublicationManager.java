package exstreino;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

// Classe principal Publication
class Publication {
    private String title;
    private String author;
    private String affiliation;
    private Date submissionDate;
    private String publicationTitle;
    private boolean acceptanceDecision;
    private Date acceptanceDecisionDate;
    private Date publicationDate;

    public Publication(String title, String author, String affiliation, Date submissionDate, String publicationTitle) {
        this.title = title;
        this.author = author;
        this.affiliation = affiliation;
        this.submissionDate = submissionDate;
        this.publicationTitle = publicationTitle;
    }

    public void decide(boolean decision, Date date) {
        this.acceptanceDecision = decision;
        this.acceptanceDecisionDate = date;
    }

    public void publish(Date date) {
        this.publicationDate = date;
    }

    // Getters e Setters
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getAffiliation() {
        return affiliation;
    }

    public void setAffiliation(String affiliation) {
        this.affiliation = affiliation;
    }

    public Date getSubmissionDate() {
        return submissionDate;
    }

    public void setSubmissionDate(Date submissionDate) {
        this.submissionDate = submissionDate;
    }

    public String getPublicationTitle() {
        return publicationTitle;
    }

    public void setPublicationTitle(String publicationTitle) {
        this.publicationTitle = publicationTitle;
    }

    public boolean isAcceptanceDecision() {
        return acceptanceDecision;
    }

    public void setAcceptanceDecision(boolean acceptanceDecision) {
        this.acceptanceDecision = acceptanceDecision;
    }

    public Date getAcceptanceDecisionDate() {
        return acceptanceDecisionDate;
    }

    public void setAcceptanceDecisionDate(Date acceptanceDecisionDate) {
        this.acceptanceDecisionDate = acceptanceDecisionDate;
    }

    public Date getPublicationDate() {
        return publicationDate;
    }

    public void setPublicationDate(Date publicationDate) {
        this.publicationDate = publicationDate;
    }

    // toString, equals, hashCode
    @Override
    public String toString() {
        return "Publication{" +
                "title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", affiliation='" + affiliation + '\'' +
                ", submissionDate=" + submissionDate +
                ", publicationTitle='" + publicationTitle + '\'' +
                ", acceptanceDecision=" + acceptanceDecision +
                ", acceptanceDecisionDate=" + acceptanceDecisionDate +
                ", publicationDate=" + publicationDate +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Publication that = (Publication) o;
        return acceptanceDecision == that.acceptanceDecision &&
                Objects.equals(title, that.title) &&
                Objects.equals(author, that.author) &&
                Objects.equals(affiliation, that.affiliation) &&
                Objects.equals(submissionDate, that.submissionDate) &&
                Objects.equals(publicationTitle, that.publicationTitle) &&
                Objects.equals(acceptanceDecisionDate, that.acceptanceDecisionDate) &&
                Objects.equals(publicationDate, that.publicationDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(title, author, affiliation, submissionDate, publicationTitle, acceptanceDecision, acceptanceDecisionDate, publicationDate);
    }
}

// Subclasses de Publication
class Article extends Publication {
    private int volumeNumber;

    public Article(String title, String author, String affiliation, Date submissionDate, String publicationTitle, int volumeNumber) {
        super(title, author, affiliation, submissionDate, publicationTitle);
        this.volumeNumber = volumeNumber;
    }

    public int getVolumeNumber() {
        return volumeNumber;
    }

    public void setVolumeNumber(int volumeNumber) {
        this.volumeNumber = volumeNumber;
    }

    // toString, equals, hashCode
    @Override
    public String toString() {
        return "Article{" +
                "volumeNumber=" + volumeNumber +
                "} " + super.toString();
    }
}

class Review extends Publication {
    private String reviewTopic;
    private int volumeNumber;

    public Review(String title, String author, String affiliation, Date submissionDate, String publicationTitle, String reviewTopic, int volumeNumber) {
        super(title, author, affiliation, submissionDate, publicationTitle);
        this.reviewTopic = reviewTopic;
        this.volumeNumber = volumeNumber;
    }

    public String getReviewTopic() {
        return reviewTopic;
    }

    public void setReviewTopic(String reviewTopic) {
        this.reviewTopic = reviewTopic;
    }

    public int getVolumeNumber() {
        return volumeNumber;
    }

    public void setVolumeNumber(int volumeNumber) {
        this.volumeNumber = volumeNumber;
    }

    // toString, equals, hashCode
    @Override
    public String toString() {
        return "Review{" +
                "reviewTopic='" + reviewTopic + '\'' +
                ", volumeNumber=" + volumeNumber +
                "} " + super.toString();
    }
}

class ConferencePaper extends Publication {
    private String conferenceLocation;

    public ConferencePaper(String title, String author, String affiliation, Date submissionDate, String publicationTitle, String conferenceLocation) {
        super(title, author, affiliation, submissionDate, publicationTitle);
        this.conferenceLocation = conferenceLocation;
    }

    public String getConferenceLocation() {
        return conferenceLocation;
    }

    public void setConferenceLocation(String conferenceLocation) {
        this.conferenceLocation = conferenceLocation;
    }

    // toString, equals, hashCode
    @Override
    public String toString() {
        return "ConferencePaper{" +
                "conferenceLocation='" + conferenceLocation + '\'' +
                "} " + super.toString();
    }
}

// Classe PublicationManager
public class PublicationManager {
    private List<Publication> publications;

    public PublicationManager() {
        this.publications = new ArrayList<>();
    }

    public void addPublication(Publication publication) {
        this.publications.add(publication);
    }

    public void listPublications() {
        for (Publication publication : this.publications) {
            System.out.println(publication.toString());
        }
    }

}
