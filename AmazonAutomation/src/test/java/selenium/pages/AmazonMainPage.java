package selenium.pages;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import selenium.utils.Driver;
import selenium.utils.GlobalConfigs;

import java.util.List;

public class AmazonMainPage extends BasePage{

    @FindBy(id="twotabsearchtextbox")
    WebElement searchBarElement;



    public void navigateToHomePage() {
        Driver.getDriver().get(GlobalConfigs.URL);
    }
    public ResultPage search(String searchText){
        searchBarElement.sendKeys(searchText+ Keys.ENTER);
        return new ResultPage();
    }




}
