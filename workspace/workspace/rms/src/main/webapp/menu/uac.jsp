<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h2 class="text-center">
    <small>USER ACCESS CONTROL</small>
</h2>
<ul class="nav">
    <c:if test="${ permissions.agent_edit_permissions }">
        <li id="agent-permissions-li"><a href="javascript:void(0);"><i
                class="glyphicon glyphicon-dashboard"></i>&nbsp;<i
                class="fa fa-chevron-right"></i> AGENT EDIT PERMISSIONS</a></li>
    </c:if>

    <c:if test="${ permissions.agent_menu_config }">
        <li id="agent-menu-li"><a href="javascript:void(0);"><i
                class="glyphicon glyphicon-stats"></i>&nbsp;<i
                class="fa fa-chevron-right"></i> AGENT MENU CONFIGURATION</a></li>
    </c:if>


    <c:if test="${ permissions.agent_dashboard_items }">
        <li id="agent-dashboard-li"><a href="javascript:void(0);"><i
                class="glyphicon glyphicon-stats"></i>&nbsp;<i
                class="fa fa-chevron-right"></i> AGENT DASHBOARD ITEMS</a></li>
    </c:if>
    <c:if test="${ permissions.admin_dashboard_items }">
        <li id="admin-dashboard-items-li"><a href="javascript:void(0);"><i
                class="glyphicon glyphicon-stats"></i>&nbsp;<i
                class="fa fa-chevron-right"></i> ADMIN DASHBOARD ITEMS</a></li>
    </c:if>
    <c:if test="${ permissions.profile_login_username }">
        <li id="profile-login-li"><a href="javascript:void(0);"><i
                class="glyphicon glyphicon-lock"></i>&nbsp;<i
                class="fa fa-chevron-right"></i> PROFILE LOGIN FIELDS</a></li>
    </c:if>
    <c:if test="${ permissions.client_setup_config }">
        <li id="client-setup-li"><a href="javascript:void(0);"><i
                class="glyphicon glyphicon-lock"></i>&nbsp;<i
                class="fa fa-chevron-right"></i> CLIENT SETUP CONFIGS</a></li>
    </c:if>
    <c:if test="${ permissions.profile_names }">
        <li id="profile-names-li"><a href="javascript:void(0);"><i
                class="glyphicon glyphicon-lock"></i>&nbsp;<i
                class="fa fa-chevron-right"></i> PROFILE NAMES</a></li>
    </c:if>
    <c:if test="${ permissions.client_names }">
        <li id="client_names-li"><a href="javascript:void(0);"><i
                class="glyphicon glyphicon-lock"></i>&nbsp;<i
                class="fa fa-chevron-right"></i> CLIENT NAMES</a></li>
    </c:if>
    <c:if test="${ permissions.users }">
        <li id="users-li"><a href="javascript:void(0);"><i
                class="glyphicon glyphicon-lock"></i>&nbsp;<i
                class="fa fa-chevron-right"></i> PORTAL USERS</a></li>
    </c:if>
    <c:if test="${ permissions.password_policy }">
        <li id="password-policy-li"><a href="javascript:void(0);"><i
                class="glyphicon glyphicon-lock"></i>&nbsp;<i
                class="fa fa-chevron-right"></i> PASSWORD POLICY</a></li>
    </c:if>
    <c:if test="${ permissions.audit_trail }">
        <li id="audit-trail-li"><a href="javascript:void(0);"><i
                class="glyphicon glyphicon-lock"></i>&nbsp;<i
                class="fa fa-chevron-right"></i> AUDIT TRAIL</a></li>
    </c:if>
</ul>


<div class="modal fade" id="modal-profile-names" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabelProfileNames" aria-hidden="true">
    <form role="form" id="form-profile-names">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabelProfileNames">
                        <i class="glyphicon glyphicon-pushpin"></i>&nbsp;&nbsp;PROFILE NAMES
                    </h4>
                </div>
                <div class="modal-body">
                    <table class="table">
                        <tr>
                            <th>PROFILE</th>
                            <th>NAME TO USE</th>
                        </tr>
                        <c:forEach var="pn" items="${profileNames}">
                            <tr>
                                <td>
                                    <label class="control-label">${ pn.profile }</label>
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="${pn.profile }_NAME"
                                           name="${pn.profile }_NAME"
                                           value="${pn.name }"/>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-warning" data-dismiss="modal">Cancel</a>
                    <input class="btn btn-primary" type="submit"
                           value="Save Settings" id="btn-profile-names">
                </div>
            </div>
        </div>
    </form>
</div>


<div class="modal fade" id="modal-profile-login" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabelProfileLogin" aria-hidden="true">
    <form role="form" id="form-profile-login">
        <input type="hidden" name="ACTION" id="ACTION" value="PLF"/>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabelProfileLogin">
                        <i class="glyphicon glyphicon-pushpin"></i>&nbsp;&nbsp;PROFILE LOGIN FIELD
                    </h4>
                </div>
                <div class="modal-body">
                    <table class="table">
                        <tr>
                            <th>PROFILE</th>
                            <th>LOGIN FIELD (USERNAME)</th>
                            <th>PORTAL ACCESS</th>
                        </tr>
                        <c:forEach var="plf" items="${plfs}">
                            <tr>
                                <td>
                                    <label class="control-label">${ plf.profile }</label>
                                </td>
                                <td>
                                    <select class="form-control" id="${ plf.profile }">
                                        <c:forEach var="ordinal" items="${ordinals}">
                                            <c:choose>
                                                <c:when test="${plf.ordinal == ordinal.code }">
                                                    <option selected="selected">${ ordinal.code }</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option>${ ordinal.code }</option>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td>
                                    <select class="form-control" name="${ plf.profile }_published"
                                            id="${ plf.profile }_published">
                                        <c:choose>
                                            <c:when test="${plf.published }">
                                                <option value="true" selected="selected">Allowed</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="true">Allowed</option>
                                            </c:otherwise>
                                        </c:choose>

                                        <c:choose>
                                            <c:when test="${plf.published == 'FALSE'}">
                                                <option value="false" selected="selected">Disallowed</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="false">Disallowed</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </select>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-warning" data-dismiss="modal">Cancel</a>
                    <input class="btn btn-primary" type="submit"
                           value="Save Settings" id="btn-profile-login">
                </div>
            </div>
        </div>
    </form>
</div>


<div class="modal fade" id="modal-password-policy" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabelPasswordPolicy" aria-hidden="true">
    <form role="form" id="form-password-policy">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabelPasswordPolicy">
                        <i class="glyphicon glyphicon-lock"></i>&nbsp;&nbsp;PASSWORD POLICY SETTINGS
                    </h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="password_policy_id" name="password_policy_id" value="${ policy.id }"/>
                    <table class="table">
                        <tr>
                            <td>
                                <label class="control-label">Password Length (Characters)</label>
                            </td>
                            <td>
                                <input type="text" class="form-control" name="length" id="length"
                                       value="${ policy.length }"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">Password Expires In? (days)</label>
                            </td>
                            <td>
                                <input type="text" class="form-control" name="expiry_days" id="expiry_days"
                                       value="${ policy.expiry_days }"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">Must have uppercase letter?</label>
                            </td>
                            <td>
                                <select class="form-control" name="uppercase" id="uppercase">
                                    <c:choose>
                                        <c:when test="${ policy.uppercase == 'TRUE' }">
                                            <option value="true" selected="selected">Yes</option>
                                            <option value="false">No</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="true">Yes</option>
                                            <option value="false" selected="selected">No</option>
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">Must have lowercase letter?</label>
                            </td>
                            <td>
                                <select class="form-control" name="lowercase" id="lowercase">
                                    <c:choose>
                                        <c:when test="${ policy.lowercase == 'TRUE' }">
                                            <option value="true" selected="selected">Yes</option>
                                            <option value="false">No</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="true">Yes</option>
                                            <option value="false" selected="selected">No</option>
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">Must have at least a number?</label>
                            </td>
                            <td>
                                <select class="form-control" name="number" id="number">
                                    <c:choose>
                                        <c:when test="${ policy.numbers == 'TRUE' }">
                                            <option value="true" selected="selected">Yes</option>
                                            <option value="false">No</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="true">Yes</option>
                                            <option value="false" selected="selected">No</option>
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">Lock user account after how many failed attempts?</label>
                            </td>
                            <td>
                                <input type="text" class="form-control" name="lock_after_count_of"
                                       id="lock_after_count_of"
                                       value="${ policy.lock_after_count_of }"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">Allow for password re-use?</label>
                            </td>
                            <td>
                                <select class="form-control" name="password_reuse" id="password_reuse">
                                    <c:choose>
                                        <c:when test="${ policy.password_reuse == 'TRUE' }">
                                            <option value="true" selected="selected">Yes</option>
                                            <option value="false">No</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="true">Yes</option>
                                            <option value="false" selected="selected">No</option>
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-warning" data-dismiss="modal">Cancel</a>
                    <input class="btn btn-primary" type="submit"
                           value="Save Settings" id="btn-save-settings">
                </div>
            </div>
        </div>
    </form>
</div>
<div class="modal fade" id="modal-agent-permissions" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabelMemberPermission" aria-hidden="true">
    <form role="form" id="form-agent-permissions">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabelMemberPermission">
                        <i class="glyphicon glyphicon-pencil"></i>&nbsp;&nbsp;AGENT PROFILE EDIT PERMISSIONS
                    </h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="member_permission_id" value="${ agentPermission.id }"
                           id="member_permission_id"/>
                    <table class="table">
                        <tr>
                            <th>FIELD</th>
                            <th>CAN EDIT</th>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">NAME</label>
                            </td>
                            <td>
                                <input type="checkbox" name="name"
                                       id="name" ${agentPermission.name == 'TRUE' ? 'checked' : ''}
                                />
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label class="control-label">EMAIL ADDRESS</label>
                            </td>
                            <td>
                                <input type="checkbox" name="emailAddress"
                                       id="emailAddress" ${agentPermission.emailAddress == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">PHONE NUMBER</label>
                            </td>
                            <td>
                                <input type="checkbox" name="phoneNumber"
                                       id="phoneNumber" ${agentPermission.phoneNumber == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">POSTAL ADDRESS</label>
                            </td>
                            <td>
                                <input type="checkbox" name="postalAddress"
                                       id="postalAddress" ${agentPermission.postalAddress == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">CITY OR TOWN</label>
                            </td>
                            <td>
                                <input type="checkbox" name="town"
                                       id="town" ${agentPermission.town == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label class="control-label">AGENT NUMBER</label>
                            </td>
                            <td>
                                <input type="checkbox" name="agentNo"
                                       id="agentNo" ${agentPermission.agentNo == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>

                    </table>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-warning" data-dismiss="modal">Cancel</a>
                    <input class="btn btn-primary" type="submit"
                           value="Save Permissions" id="btn-member-permissions">
                </div>
            </div>
        </div>
    </form>
</div>


<div class="modal fade" id="modal-agent-menu" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabelMemberMenu" aria-hidden="true">
    <form role="form" id="form-agent-menu">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabelMemberMenu">
                        <i class="glyphicon glyphicon-stats"></i>&nbsp;&nbsp;HIDE/SHOW AGENT MENU OPTIONS
                    </h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="memberMenu_id" value="${ agentMenu.id }" id="memberMenu_id"/>
                    <table class="table">
                        <tr>
                            <th>ITEM</th>
                            <th>SHOW/HIDE</th>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">ADD TENANT</label>
                            </td>
                            <td>
                                <input type="checkbox" name="addTenant"
                                       id="addTenant" ${agentMenu.addTenant == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">VIEW TENANT</label>
                            </td>
                            <td>
                                <input type="checkbox" name="viewTenant"
                                       id="viewTenant" ${agentMenu.viewTenant == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label class="control-label">VIEW TENANT GRID</label>
                            </td>
                            <td>
                                <input type="checkbox" name="viewTenantGrid"
                                       id="viewTenantGrid" ${agentMenu.viewTenantGrid == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <label class="control-label">ADD TENANCY CONTRACT</label>
                            </td>
                            <td>
                                <input type="checkbox" name="addContract"
                                       id="addContract" ${agentMenu.addContract == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">UPLOAD ADD TENANCY CONTRACT</label>
                            </td>
                            <td>
                                <input type="checkbox" name="addContractBatch"
                                       id="addContractBatch" ${agentMenu.addContractBatch == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <label class="control-label">VIEW TENANCY CONTRACT</label>
                            </td>
                            <td>
                                <input type="checkbox" name="viewContract"
                                       id="viewContract" ${agentMenu.viewContract == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label class="control-label">VIEW TENANCY CONTRACT GRID</label>
                            </td>
                            <td>
                                <input type="checkbox" name="viewContractGrid"
                                       id="viewContractGrid" ${agentMenu.viewContractGrid == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <label class="control-label"> ADD UNIT </label>
                            </td>
                            <td>
                                <input type="checkbox" name="addUnit"
                                       id="addUnit" ${agentMenu.addUnit == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <label class="control-label"> VIEW UNIT</label>
                            </td>
                            <td>
                                <input type="checkbox" name="viewUnit"
                                       id="viewUnit" ${agentMenu.viewUnit == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <label class="control-label"> VIEW UNIT GRID</label>
                            </td>
                            <td>
                                <input type="checkbox" name="viewUnitGrid"
                                       id="viewUnitGrid" ${agentMenu.viewUnitGrid == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <label class="control-label"> MANAGE SERVICE CHARGE</label>
                            </td>
                            <td>
                                <input type="checkbox" name="addServiceCharge"
                                       id="addServiceCharge" ${agentMenu.addServiceCharge == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label class="control-label"> VIEW SERVICE CHARGES</label>
                            </td>
                            <td>
                                <input type="checkbox" name="viewServiceCharge"
                                       id="viewServiceCharge" ${agentMenu.viewServiceCharge == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <label class="control-label"> VIEW SERVICE CHARGES GRID</label>
                            </td>
                            <td>
                                <input type="checkbox" name="viewServiceChargeGrid"
                                       id="viewServiceChargeGrid" ${agentMenu.viewServiceChargeGrid == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label class="control-label">RECORD RENT</label>
                            </td>
                            <td>
                                <input type="checkbox" name="recordRent"
                                       id="recordRent" ${agentMenu.recordRent == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label class="control-label">RENT BATCH UPLOAD</label>
                            </td>
                            <td>
                                <input type="checkbox" name="uploadRent"
                                       id="uploadRent" ${agentMenu.uploadRent == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label class="control-label"> PRINT INVOICE</label>
                            </td>
                            <td>
                                <input type="checkbox" name="printInvoice"
                                       id="printInvoice" ${agentMenu.printInvoice == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label class="control-label"> UPLOAD RECEIPTS</label>
                            </td>
                            <td>
                                <input type="checkbox" name="uploadReceipts"
                                       id="uploadReceipts" ${agentMenu.uploadReceipts == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label class="control-label">ISSUE RECEIPTS</label>
                            </td>
                            <td>
                                <input type="checkbox" name="issueReceipts"
                                       id="issueReceipts" ${agentMenu.issueReceipts == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label class="control-label"> VIEW RENT PAID </label>
                            </td>
                            <td>
                                <input type="checkbox" name="viewRentPaid"
                                       id="viewRentPaid" ${agentMenu.viewRentPaid == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <label class="control-label"> VIEW RENT PAID GRID</label>
                            </td>
                            <td>
                                <input type="checkbox" name="viewRentPaidGrid"
                                       id="viewRentPaidGrid" ${agentMenu.viewRentPaidGrid == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <label class="control-label"> VIEW RENT ARREARS </label>
                            </td>
                            <td>
                                <input type="checkbox" name="viewRentArrears"
                                       id="viewRentArrears" ${agentMenu.viewRentArrears == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <label class="control-label"> VIEW RENT ARREARS GRID</label>
                            </td>
                            <td>
                                <input type="checkbox" name="viewRentArrearsGrid"
                                       id="viewRentArrearsGrid" ${agentMenu.viewRentArrearsGrid == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <label class="control-label"> VIEW RENT PREPAID </label>
                            </td>
                            <td>
                                <input type="checkbox" name="viewprepaidRent"
                                       id="viewprepaidRent" ${agentMenu.viewprepaidRent == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label class="control-label"> VIEW RENT PREPAID GRID </label>
                            </td>
                            <td>
                                <input type="checkbox" name="viewprepaidRentGrid"
                                       id="viewprepaidRentGrid" ${agentMenu.viewprepaidRentGrid == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <label class="control-label"> MEDIA & FILES </label>
                            </td>
                            <td>
                                <input type="checkbox" name="Media"
                                       id="Media" ${agentMenu.media == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label"> DOCUMENTS </label>
                            </td>
                            <td>
                                <input type="checkbox" name="document"
                                       id="document" ${agentMenu.document == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>

                    </table>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-warning" data-dismiss="modal">Cancel</a>
                    <input class="btn btn-primary" type="submit"
                           value="Save Permissions" id="btn-member-menu">
                </div>
            </div>
        </div>
    </form>
</div>
<!-- End Member Menu -->


<!-- Member Dashboard Items Start -->

<div class="modal fade" id="modal-dashboard-items" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabelMemberDashboard" aria-hidden="true">
    <form role="form" id="form-agent-dashboard">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabelMemberDashboard">
                        <i class="glyphicon glyphicon-stats"></i>&nbsp;&nbsp;HIDE/SHOW AGENT DETAILS ON DASHBOARD
                    </h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="agentDashboard_id" value="${ agentDashboard.id }"
                           id="agentDashboard_id"/>
                    <table class="table">
                        <tr>
                            <th>ITEM</th>
                            <th>SHOW/HIDE</th>
                        </tr>


                        <tr>
                            <td>
                                <label class="control-label">NAME</label>
                            </td>
                            <td>
                                <input type="checkbox" name="name2"
                                       id="name2" ${agentDashboard.name == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <label class="control-label"> PHONE NUMBER </label>
                            </td>
                            <td>
                                <input type="checkbox" name="phoneNumber2"
                                       id="phoneNumber2" ${agentDashboard.phoneNumber == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label class="control-label"> EMAIL ADDRESS </label>
                            </td>
                            <td>
                                <input type="checkbox" name="emailAddress2"
                                       id="emailAddress2" ${agentDashboard.emailAddress == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label class="control-label"> AGENT NUMBER </label>
                            </td>
                            <td>
                                <input type="checkbox" name="agentNumber2"
                                       id="agentNumber2" ${agentDashboard.agentNumber == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>


                    </table>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-warning" data-dismiss="modal">Cancel</a>
                    <input class="btn btn-primary" type="submit"
                           value="Save Permissions" id="btn-dashboard-items">
                </div>
            </div>
        </div>
    </form>
</div>
<!-- End Member Dashboard Items-->

<!-- Admin Dashboard Items Start -->

<div class="modal fade" id="modal-admin-dashboard" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabelAdminDashboard" aria-hidden="true">
    <form role="form" id="form-admin-dashboard">
        <div class="modal-dialog">


            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabelAdminDashboard">
                        <i class="glyphicon glyphicon-stats"></i>&nbsp;&nbsp;HIDE/SHOW DETAILS ON DASHBOARD
                    </h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="adminDashboard_id" value="${ adminDashboard.id }"
                           id="adminDashboard_id"/>
                    <table class="table">
                        <tr>
                            <th>ITEM</th>
                            <th>SHOW/HIDE</th>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">PROPERTIES </label>
                            </td>
                            <td>
                                <input type="checkbox" name="numberOfProperties"
                                       id="numberOfProperties" ${adminDashboard.numberOfProperties == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">AGENTS </label>
                            </td>
                            <td>
                                <input type="checkbox" name="numberOfAgents"
                                       id="numberOfAgents" ${adminDashboard.numberOfAgents == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label class="control-label"> ACTIVE TENANTS </label>
                            </td>
                            <td>
                                <input type="checkbox" name="activeTenants"
                                       id="activeTenants" ${adminDashboard.activeTenants == 'TRUE' ? 'checked' : ''}
                                />
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <label class="control-label"> UNITS </label>
                            </td>
                            <td>
                                <input type="checkbox" name="numberOfUnits"
                                       id="numberOfUnits" ${adminDashboard.numberOfUnits == 'TRUE' ? 'checked' : ''}
                                />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label"> OCCUPIED UNITS </label>
                            </td>
                            <td>
                                <input type="checkbox" name="occupiedUnits"
                                       id="occupiedUnits" ${adminDashboard.occupiedUnits == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <label class="control-label"> VACANT UNITS </label>
                            </td>
                            <td>
                                <input type="checkbox" name="vacantUnits"
                                       id="vacantUnits" ${adminDashboard.vacantUnits == 'TRUE' ? 'checked' : ''}/>
                            </td>
                        </tr>


                    </table>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-warning" data-dismiss="modal">Cancel</a>
                    <input class="btn btn-primary" type="submit"
                           value="Save Permissions" id="btn-admin-dashboard">
                </div>
            </div>
        </div>
    </form>
</div>
<!-- End Admin Dashboard Items-->

<script type="text/javascript">
    $(document).ready(function () {


        function load_dashboard(MODULE) {
            start_wait();
            $.ajax({
                url: $('#base_url').val() + 'dashboard',
                type: 'get',
                data: {dashboard: MODULE},
                dataType: 'html',
                success: function (html) {
                    $('#dashboard').fadeOut('slow', function () {
                        stop_wait();
                        $('#dashboard').html(html);
                        $('#dashboard').fadeIn('slow');
                        stop_wait();
                    });
                }
            });
        }

        $('#form-profile-login').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {}
        })
            .on('success.form.bv', function (e) {

                // Prevent form submission
                e.preventDefault();

                var btn = "btn-profile-login";
                var form = "form-profile-login";
                var modal = "modal-profile-login";
                var btn_text = $('#' + btn).val();

                $('#' + btn).val('Please wait...');
                $.ajax({
                    url: $('#base_url').val() + 'admin',
                    type: 'post',
                    data: {
                        ACTION: 'PROFILE_LOGIN_FIELD',
                        AGENT: $('#AGENT').val(),
                        AGENT_PUBLISHED: $('#AGENT_published').val(),
                        ADMINISTRATOR: $('#ADMINISTRATOR').val(),
                        ADMINISTRATOR_PUBLISHED: $('#ADMINISTRATOR_published').val(),
                        LANDLORD: $('#LANDLORD').val(),
                        LANDLORD_PUBLISHED: $('#LANDLORD_published').val()
                    },
                    dataType: 'json',
                    success: function (json) {
                        $('#' + btn).val('Done');
                        if (json.success) {
                            $('#' + form)[0].reset();
                            $('#' + modal).modal('hide');
                            html = 'Profile login details successfully saved';
                        }
                        else
                            html = 'Profile login details could not be saved';
                        bootbox.alert(html);
                        $('#' + btn).val(btn_text);
                    }
                });

            });

        $('#form-client-setup').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {}

        })
            .on('success.form.bv', function (e) {

                // Prevent form submission
                e.preventDefault();

                var btn = "btn-client-setup";
                var form = "form-client-setup";
                var modal = "modal-client-setup";
                var btn_text = $('#' + btn).val();

                $('#' + btn).val('Please wait...');
                $.ajax({
                    url: $('#base_url').val() + 'admin',
                    type: 'post',
                    data: {
                        ACTION: 'CLIENT_SETUP_FIELD',
                        client: $('#client').val(), msg: $('#msg').val(),
                    },


                    dataType: 'json',
                    success: function (json) {
                        $('#' + btn).val('Done');
                        if (json.success) {
                            $('#' + form)[0].reset();
                            $('#' + modal).modal('hide');
                            html = 'Client setup details successfully saved';
                        }
                        else
                            html = 'Client setup details could not be saved';
                        bootbox.alert(html);
                        $('#' + btn).val(btn_text);
                    }
                });

            });

        $('#form-profile-names').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {}
        })
            .on('success.form.bv', function (e) {

                // Prevent form submission
                e.preventDefault();

                var btn = "btn-profile-names";
                var form = "form-profile-names";
                var modal = "modal-profile-names";
                var btn_text = $('#' + btn).val();

                $('#' + btn).val('Please wait...');
                $.ajax({
                    url: $('#base_url').val() + 'admin',
                    type: 'post',
                    data: {
                        ACTION: 'PROFILE_NAMES',
                        ADMINISTRATOR: $('#ADMINISTRATOR_NAME').val(),
                        LANDLORD: $('#LANDLORD_NAME').val(),
                        AGENT: $('#AGENT_NAME').val()

                    },
                    dataType: 'json',
                    success: function (json) {
                        $('#' + btn).val('Done');
                        if (json.success) {
                            $('#' + form)[0].reset();
                            $('#' + modal).modal('hide');
                            html = 'Profile names successfully saved';
                        }
                        else
                            html = 'Profile names could not be saved';
                        bootbox.alert(html);
                        $('#' + btn).val(btn_text);
                    }
                });

            });

        $('#form-client-names').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {}
        })
            .on('success.form.bv', function (e) {

                // Prevent form submission
                e.preventDefault();

                var btn = "btn-client-names";
                var form = "form-client-names";
                var modal = "modal-client-names";
                var btn_text = $('#' + btn).val();

                $('#' + btn).val('Please wait...');
                $.ajax({
                    url: $('#base_url').val() + 'admin',
                    type: 'post',
                    data: {
                        ACTION: 'CLIENT_NAMES',
                        ETL: $('#ETL_NAME').val(),
                        UAPUG: $('#UAPUG_NAME').val(),
                        UAPKE: $('#UAPKE_NAME').val(),
                        LAPFUND: $('#LAPFUND_NAME').val(),
                        CBK: $('#CBK_NAME').val(),
                        BOU: $('#BOU_NAME').val(),
                        BRITAM: $('#BRITAM_NAME').val(),
                        KP: $('#KP_NAME').val(),
                        KENGEN: $('#KENGEN_NAME').val()
                    },
                    dataType: 'json',
                    success: function (json) {
                        $('#' + btn).val('Done');
                        if (json.success) {
                            $('#' + form)[0].reset();
                            $('#' + modal).modal('hide');
                            html = 'Client names successfully saved';
                        }
                        else
                            html = 'Client names could not be saved';
                        bootbox.alert(html);
                        $('#' + btn).val(btn_text);
                    }
                });

            });


        $('#form-password-policy').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {}
        })
            .on('success.form.bv', function (e) {

                // Prevent form submission
                e.preventDefault();

                var btn = "btn-password-policy";
                var form = "form-password-policy";
                var modal = "modal-password-policy";
                var btn_text = $('#' + btn).val();

                $('#' + btn).val('Please wait...');
                $.ajax({
                    url: $('#base_url').val() + 'admin',
                    type: 'post',
                    data: {
                        password_policy_id: $('#password_policy_id').val(),
                        ACTION: 'SET_PASSWORD_POLICY',
                        length:
                            $('#length').val(),
                        expiry_days: $('#expiry_days').val(),
                        uppercase: $('#uppercase').val(),
                        lowercase:
                            $('#lowercase').val(),
                        numbers: $('#numbers').val(),
                        lock_after_count_of: $('#lock_after_count_of').val(),
                        password_reuse: $('#password_reuse').val()
                    },
                    dataType: 'json',
                    success: function (json) {
                        $('#' + btn).val('Done');
                        if (json.success) {
                            $('#' + form)[0].reset();
                            $('#' + modal).modal('hide');
                            html = 'Password policy settings successfully saved';
                        }
                        else
                            html = 'Password policy settings could not be saved';
                        bootbox.alert(html);
                        $('#' + btn).val(btn_text);
                    }
                });

            });

        /* Form Member Permissions */

        $('#form-agent-permissions').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {}
        })
            .on('success.form.bv', function (e) {

                // Prevent form submission
                e.preventDefault();

                var btn = "btn-agent-permissions";
                var form = "form-agent-permissions";
                var modal = "modal-agent-permissions";
                var btn_text = $('#' + btn).val();

                $('#' + btn).val('Please wait...');
                $.ajax({
                    url: $('#base_url').val() + 'admin',
                    type: 'post',
                    data: {
                        ACTION: 'AGENT_PERMISSION',
                        agent_permission_id: $('#member_permission_id').val(),
                        country: $('#country').prop('checked'),
                        emailAddress: $('#emailAddress').prop('checked'),
                        name: $('#name').prop('checked'),
                        phoneNumber: $('#phoneNumber').prop('checked'),
                        postalAddress: $('#postalAddress').prop('checked'),
                        agentNo: $('#agentNo').prop('checked'),
                        town: $('#town').prop('checked')

                    },
                    dataType: 'json',
                    success: function (json) {
                        $('#' + btn).val('Done');
                        if (json.success) {
                            $('#' + form)[0].reset();
                            $('#' + modal).modal('hide');
                            html = 'Member permission details successfully saved';
                        }
                        else
                            html = 'Member permission details could not be saved';
                        bootbox.alert(html);
                        $('#' + btn).val(btn_text);
                    }
                });

            });
        /* End Form Member Permissions */


        /* Form Member Menu */

        $('#form-agent-menu').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {}
        })
            .on('success.form.bv', function (e) {

                // Prevent form submission
                e.preventDefault();

                var btn = "btn-agent-menu";
                var form = "form-agent-menu";
                var modal = "modal-agent-menu";
                var btn_text = $('#' + btn).val();

                $('#' + btn).val('Please wait...');
                $.ajax({
                    url: $('#base_url').val() + 'admin',
                    type: 'post',
                    data: {
                        ACTION: 'AGENT_MENU_CONFIG',

                        addTenant: $('#addTenant').prop('checked'),
                        viewTenant: $('#viewTenant').prop('checked'),
                        viewTenantGrid: $('#viewTenantGrid').prop('checked'),
                        sendNotification: $('#sendNotification').prop('checked'),
                        addContract: $('#addContract').prop('checked'),
                        viewContract: $('#viewContract').prop('checked'),
                        viewContractGrid: $('#viewContractGrid').prop('checked'),
                        addUnit: $('#addUnit').prop('checked'),
                        viewUnit: $('#viewUnit').prop('checked'),
                        viewUnitGrid: $('#viewUnitGrid').prop('checked'),
                        addServiceCharge: $('#addServiceCharge').prop('checked'),
                        viewServiceCharge: $('#viewServiceCharge').prop('checked'),
                        viewServiceChargeGrid: $('#viewServiceChargeGrid').prop('checked'),
                        recordRent: $('#recordRent').prop('checked'),
                        uploadRent: $('#uploadRent').prop('checked'),
                        addContractBatch: $('#addContractBatch').prop('checked'),
                        printInvoice: $('#printInvoice').prop('checked'),
                        uploadReceipts: $('#uploadReceipts').prop('checked'),
                        issueReceipts: $('#issueReceipts').prop('checked'),
                        viewRentPaid: $('#viewRentPaid').prop('checked'),
                        viewRentPaidGrid: $('#viewRentPaidGrid').prop('checked'),
                        viewRentArrears: $('#viewRentArrears').prop('checked'),
                        viewRentArrearsGrid: $('#viewRentArrearsGrid').prop('checked'),
                        viewprepaidRent: $('#viewprepaidRent').prop('checked'),
                        viewprepaidRentGrid: $('#viewprepaidRentGrid').prop('checked'),
                        releaseUnit: $('#releaseUnit').prop('checked'),
                        Media: $('#Media').prop('checked'),
                        document: $('#document').prop('checked'),
                    },
                    dataType: 'json',
                    success: function (json) {
                        $('#' + btn).val('Done');
                        if (json.success) {
                            $('#' + form)[0].reset();
                            $('#' + modal).modal('hide');
                            html = 'Configuration details successfully saved';
                        }
                        else
                            html = 'Configuration details could not be saved';
                        bootbox.alert(html);
                        $('#' + btn).val(btn_text);
                    }
                });

            });
        /* End Form Member Menu */


        /* Form Dashboard Items */

        $('#form-agent-dashboard').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {}
        })
            .on('success.form.bv', function (e) {

                // Prevent form submission
                e.preventDefault();

                var btn = "btn-dashboard-items";
                var form = "form-agent-dashboard";
                var modal = "modal-dashboard-items";
                var btn_text = $('#' + btn).val();

                $('#' + btn).val('Please wait...');
                $.ajax({
                    url: $('#base_url').val() + 'admin',
                    type: 'post',
                    data: {
                        ACTION: 'AGENT_DASHBOARD_ITEMS',
                        name2: $('#name2').prop('checked'),
                        phoneNumber2: $('#phoneNumber2').prop('checked'),
                        emailAddress2: $('#emailAddress2').prop('checked'),
                        agentNumber2: $('#agentNumber2').prop('checked')
                    },
                    dataType: 'json',
                    success: function (json) {
                        $('#' + btn).val('Done');
                        if (json.success) {
                            $('#' + form)[0].reset();
                            $('#' + modal).modal('hide');
                            html = 'Configuration details successfully saved';
                        }
                        else
                            html = 'Configuration details could not be saved';
                        bootbox.alert(html);
                        $('#' + btn).val(btn_text);
                    }
                });

            });
        /* End Form Dashboard Items */

        /* Form Admin Dashboard Items */

        $('#form-admin-dashboard').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {}
        })
            .on('success.form.bv', function (e) {

                // Prevent form submission
                e.preventDefault();

                var btn = "btn-admin-dashboard";
                var form = "form-admin-dashboard";
                var modal = "modal-admin-dashboard";
                var btn_text = $('#' + btn).val();

                $('#' + btn).val('Please wait...');
                $.ajax({
                    url: $('#base_url').val() + 'admin',
                    type: 'post',
                    data: {
                        ACTION: 'ADMIN_DASHBOARD_ITEMS',
                        numberOfProperties: $('#numberOfProperties').prop('checked'),
                        numberOfAgents: $('#numberOfAgents').prop('checked'),
                        activeTenants: $('#activeTenants').prop('checked'),
                        vacantUnits: $('#vacantUnits').prop('checked'),
                        numberOfUnits: $('#numberOfUnits').prop('checked'),
                        occupiedUnits: $('#occupiedUnits').prop('checked'),

                    },
                    dataType: 'json',
                    success: function (json) {
                        $('#' + btn).val('Done');
                        if (json.success) {
                            $('#' + form)[0].reset();
                            $('#' + modal).modal('hide');
                            html = 'Configuration details successfully saved';
                        }
                        else
                            html = 'Configuration details could not be saved';
                        bootbox.alert(html);
                        $('#' + btn).val(btn_text);
                    }
                });

            });
        /* End Form Admin Dashboard Items */


        $('#agent-permissions-li').click(function () {
            $('#modal-agent-permissions').modal('show');
        });


        $('#agent-menu-li').click(function () {
            $('#modal-agent-menu').modal('show');
        });


        $('#admin-dashboard-items-li').click(function () {
            $('#modal-admin-dashboard').modal('show');
        });

        $('#profile-login-li').click(function () {
            $('#modal-profile-login').modal('show');
        });
        $('#client-setup-li').click(function () {
            $('#modal-client-setup').modal('show');
        });

        $('#agent-dashboard-li').click(function () {
            $('#modal-dashboard-items').modal('show');
        });

        $('#profile-names-li').click(function () {
            $('#modal-profile-names').modal('show');
        });

        $('#client_names-li').click(function () {
            $('#modal-client_names').modal('show');
        });


        $('#password-policy-li').click(function () {
            $('#modal-password-policy').modal('show');
        });


        $('#users-li').click(function () {
            load_dashboard('USER');
        });

        $('#audit-trail-li').click(function () {
            load_dashboard('AUDIT_TRAIL');
        });


    });
</script>