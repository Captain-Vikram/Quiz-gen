import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.layout.BorderPane;
import javafx.scene.web.WebView;
import javafx.stage.Stage;

public class WebQuizApp extends Application {

    @Override
    public void start(Stage primaryStage) {
        // Create a WebView to load the quiz website
        WebView webView = new WebView();
        
        // Set the URL to your quiz generator (replace with your quiz generator URL)
        String quizUrl = "http://localhost/Quiz-Generator-main/login.html";
        webView.getEngine().load(quizUrl);

        // Create a layout (BorderPane) to hold the WebView
        BorderPane root = new BorderPane();
        root.setCenter(webView);

        // Create a Scene with the layout
        Scene scene = new Scene(root, 1024, 768); // Set window size

        // Set the title of the application window
        primaryStage.setTitle("Quiz Generator");
        
        // Set the scene and show the stage (window)
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);  // Launch the JavaFX application
    }
}
