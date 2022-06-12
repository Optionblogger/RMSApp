package com.rentmanagement.hubtel;

public class HttpRequestException extends Exception {

    private static final long serialVersionUID = -2413629666163901633L;

    private HttpResponse httpResponse;

    /**
     * Constructs the exception with
     *
     * @param e
     * @param httpResponse
     */
    public HttpRequestException(Exception e, HttpResponse httpResponse) {
        super(e);
        this.httpResponse = httpResponse;
    }

    public HttpRequestException(Exception e) {
        super(e.getMessage());
    }

    /**
     * Access the response.
     *
     * @return Response object
     */
    public HttpResponse getHttpResponse() {
        return httpResponse;
    }
}
