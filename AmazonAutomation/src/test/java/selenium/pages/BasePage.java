package selenium.pages;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import selenium.utils.Driver;
import selenium.utils.GlobalConfigs;

public class BasePage {

    public BasePage() {
        PageFactory.initElements(Driver.getDriver(), this);
//        navigateToHomePage();
    }

    public void navigateToHomePage() {
        Driver.getDriver().get(GlobalConfigs.URL);
    }

//    @FindBy(css = "a[href='/logout']")
//    public WebElement logoutButtonWebElement;
//
//
//
//
//
//    public void logout() {
//        logoutButtonWebElement.click();
//
//    }
}
