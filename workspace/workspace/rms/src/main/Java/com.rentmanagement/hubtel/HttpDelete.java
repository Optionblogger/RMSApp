package com.rentmanagement.hubtel;



public class HttpDelete extends HttpRequest {

    /**
     * Constructs an HTTP DELETE request.
     *
     * @param path Partial URL
     * @param params Name-value pairs to be appended to the URL
     */
    public HttpDelete(String path, ParameterMap params) {
        super(path, params);
        this.httpMethod = HttpMethod.DELETE;
    }

}
