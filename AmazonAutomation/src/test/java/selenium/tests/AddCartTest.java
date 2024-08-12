package selenium.tests;

import org.junit.After;
import org.testng.Assert;
import org.testng.annotations.Test;
import selenium.pages.*;
import selenium.utils.Driver;


public class AddCartTest {
    private AmazonMainPage amazonMainPage;
    private ResultPage resultPage;

    private ProductDetailsPage productDetailsPage;

    private ConfirmationPage confirmationPage;

    private CartPage cartPage;


    public AddCartTest() {
        amazonMainPage = new AmazonMainPage();
    }

    @After
    public void tearDown(){
        Driver.getDriver().quit();
    }

    @Test
    public void addCartTest() {
        amazonMainPage.navigateToHomePage();
        resultPage = amazonMainPage.search("hats for man");
        productDetailsPage = resultPage.clickResultProduct(0);
        productDetailsPage.selectQuantity("2");
        confirmationPage = productDetailsPage.clickAddToCartButton();
        cartPage =  confirmationPage.goToCart();
        Assert.assertEquals(cartPage.getProductPrice()*2,cartPage.getTotalPrice());

    }

}
