package PetAPITest;

import ResponseDTO.GetPetByStatusResponseDTO;
import io.restassured.RestAssured;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;


public class GetPetByStatusTest {
    private final String ENDPOINT = "/pet/findByStatus";

    @Test
    @DisplayName("Get all the pets with available status")
    public void getPetByStatus_available_success() {

        List<GetPetByStatusResponseDTO> result = RestAssured.with()
                .baseUri("https://petstore.swagger.io/v2")
                .given()
                .queryParam("status", "available")
                .when()
                .get(ENDPOINT)
                .then()
                .statusCode(200)
                .extract()
                .body()
                .jsonPath()
                .getList(".", GetPetByStatusResponseDTO.class);

        assertNotNull(result);
        assertEquals(result.get(0).getStatus(),"available");

    }

    @Test
    @DisplayName("Get all the pets with sold status")
    public void getPetByStatus_sold_success() {

        List<GetPetByStatusResponseDTO> result = RestAssured.with()
                .baseUri("https://petstore.swagger.io/v2")
                .given()
                .queryParam("status", "sold")
                .when()
                .get(ENDPOINT)
                .then()
                .statusCode(200)
                .extract()
                .body()
                .jsonPath()
                .getList(".", GetPetByStatusResponseDTO.class);

        assertNotNull(result);
        assertEquals(result.get(0).getStatus(),"sold");

    }

    @Test
    @DisplayName("Get all the pets with pending status")
    public void getPetByStatus_pending_success() {

        List<GetPetByStatusResponseDTO> result = RestAssured.with()
                .baseUri("https://petstore.swagger.io/v2")
                .given()
                .queryParam("status", "pending")
                .when()
                .get(ENDPOINT)
                .then()
                .statusCode(200)
                .extract()
                .body()
                .jsonPath()
                .getList(".", GetPetByStatusResponseDTO.class);

        assertNotNull(result);
        assertEquals(result.get(0).getStatus(),"pending");

    }

    @Test
    @DisplayName("Get all the pets with unknown status")
    public void getPetByStatus_unknown_success() {

        List<GetPetByStatusResponseDTO> result = RestAssured.with()
                .baseUri("https://petstore.swagger.io/v2")
                .given()
                .queryParam("status", "unknown")
                .when()
                .get(ENDPOINT)
                .then()
                .statusCode(200)
                .extract()
                .body()
                .jsonPath()
                .getList(".", GetPetByStatusResponseDTO.class);

        assertEquals(result.size(),0);

    }

    @Test
    @DisplayName("Get pets when no status is passed")
    public void getPetByStatus_noStatus_success() {

        List<GetPetByStatusResponseDTO> result = RestAssured.with()
                .baseUri("https://petstore.swagger.io/v2")
                .given()
                .when()
                .get(ENDPOINT)
                .then()
                .statusCode(200)
                .extract()
                .body()
                .jsonPath()
                .getList(".", GetPetByStatusResponseDTO.class);

        assertEquals(result.size(),0);

    }


}
