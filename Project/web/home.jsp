
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lí bệnh nhân</title>
        <c:if test="${sessionScope.user==null}">
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
        </c:if>
        <jsp:useBean id="dateUtils" scope="page" class="utils.DateExp" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script >
            function deletepaitnet(pid) {
                if (confirm("Do you want to delete?")) {
                    window.location = "deletepaitnet?pid=" + pid;
                }
            }
        </script>
    </head>
    <body>
        <c:if test="${sessionScope.user==null}">
            <style>
                body{
                    background-color: black;
                    color: white;
                }

                h1 {
                    color: red;
                }

                h6{
                    color: red;
                    text-decoration: underline;
                }
            </style>
            <div class="w3-display-middle">
                <h1 class="w3-jumbo w3-animate-top w3-center"><code>Access Denied</code></h1>
                <hr class="w3-border-white w3-animate-left" style="margin:auto;width:50%">
                <h3 class="w3-center w3-animate-right">You dont have permission to view this site.</h3>
                <h3 class="w3-center w3-animate-zoom">🚫🚫🚫🚫</h3>
                <a href="login.jsp"><h6 class="w3-center w3-animate-zoom">Back to login</h6></a>
            </div>
        </c:if>
        <c:if test="${sessionScope.user!=null}">
            <style>
                body {
                    font-family: Arial, sans-serif;
                    margin: 0;
                    padding: 0;
                }

                header {
                    background-color: white;
                    padding: 0;
                    display: flex;
                    align-items: center;
                }
                .logo {
                    margin-right: 10px; /* Khoảng cách giữa logo và chữ */
                }

                .heading {
                    display: flex;
                    flex-direction: column;
                }
                h1 {
                    margin: 0;
                    color: #333;
                }

                nav ul {
                    list-style-type: none;
                    margin: 0;
                    padding: 0;
                    background-color: #333;
                }

                nav ul li {
                    display: inline-block;
                    margin-right: 10px;
                }

                nav ul li a {
                    display: block;
                    color: #fff;
                    text-decoration: none;
                    padding: 10px;
                }

                section {
                    padding: 20px;
                }

                h2 {
                    margin-top: 0;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                }

                th, td {
                    padding: 10px;
                    border: 1px solid #ccc;
                }

                footer {
                    background-color: #f5f5f5;
                    padding: 20px;
                    text-align: center;
                }

            </style>
            <header>
                <div class="logo">
                    <img style="width:200px" src="https://phuongnamvina.com/img_data/images/logo-benh-vien.jpg" alt="Logo">
                </div>
                <div class="heading">
                    <h1>Bệnh viện XYZ</h1>
                    <h2 style="display:none">Xin chào ${sessionScope.user.getDisplayname()}</h2>
                </div>
            </header>
            <div >
                <nav >
                    <ul>
                        <div class="container">
                            <li>
                                <button id="add-patient" type="button" class="btn btn-primary" data-toggle="modal" data-target="#addPatientModal">
                                    Thêm bệnh nhân
                                </button>
                            </li>
                            <li>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addDiagnosisModal">
                                    Thêm chuẩn đoán
                                </button>
                            </li>
                            <li><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#patientHistoryModal">
                                    Lịch sử bệnh nhân
                                </button></li>

                            <li><a href="list">
                                    <button type="button" class="btn btn-primary" >
                                        Lịch sử chuẩn đoán
                                    </button></a>
                            </li>
                            <li>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateInformation">
                                    Thay đổi thông tin
                                </button>
                            </li>
                            <li>
                                <a href="logout"><button type="button" class="btn btn-primary" >
                                        Đăng xuất
                                    </button></a>
                            </li>
                        </div>

                    </ul>
                </nav>
            </div>
            <section>
                <h2>Danh sách bệnh nhân</h2>
                <div class="container">
                    <table>
                        <thead>
                            <tr>
                                <th style="width:10rem">Mã Bệnh Nhân</th>
                                <th>Tên</th>
                                <th>Địa chỉ</th>
                                <th>Ngày sinh</th>
                                <th>Điện thoại</th>
                                <th style="width: 15rem;">Thao tác</th>

                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${listP}">
                                <tr>
                                    <td>${p.getId()}</td>
                                    <td>${p.getName()}</td>
                                    <td>${p.getAddress()}</td>
                                    <td>${dateUtils.convertDate(p.getDob())}</td>
                                    <td>${p.getContact()}</td>
                                    <td>
                                        <a onclick="deletepaitnet('${p.getId()}')" href="#"><button type="button" class="btn btn-primary" >
                                                Xóa
                                            </button></a>
                                        <button type="button" class="btn btn-primary edit-button" data-toggle="modal" data-target="#addPatientModal"
                                                data-patient='${p.toJSON()}'>
                                            Sửa thông tin
                                        </button>
                                    </td>
                                </tr>       
                            </c:forEach>
                        </tbody>
                    </table>
                    <!-- Thêm mã HTML sau dòng <table> trong section -->
                    <div class="pagination">
                        <ul class="pagination justify-content-center">
                            <c:if test="${currentPage==1}">
                                <div hidden>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Start">
                                            <span aria-hidden="true">First</span>                
                                        </a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                </div>
                            </c:if>
                            <c:if test="${currentPage!=1}">
                                
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Start">
                                            <span aria-hidden="true">First</span>                
                                        </a>
                                    </li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                
                            </c:if>

                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">4</a></li>
                            <li class="page-item"><a class="page-link" href="#">5</a></li>
                            <li class="page-item"><a class="page-link" href="#">6</a></li>
                            <li class="page-item"><a class="page-link" href="#">7</a></li>
                            <li class="page-item"><a class="page-link" href="#">8</a></li>
                            <li class="page-item"><a class="page-link" href="#">9</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                            <a class="page-link" href="#" aria-label="Start">
                                <span aria-hidden="true">End</span>                
                            </a>
                        </ul>
                    </div>

                </div>

            </div>

        </section>
        <!-- Modal thêm bệnh nhân -->
        <div class="modal fade" id="addPatientModal" tabindex="-1" role="dialog" aria-labelledby="addPatientModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addPatientModalLabel">Thêm bệnh nhân</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="addpaitnet" method="post">
                        <div class="modal-body">

                            <input type="text" name="pcreate" value="${sessionScope.user.getUsername()}" hidden>
                            <input type="text" name="pid" class="form-control" id="inputId" hidden >
                            <div class="form-group">
                                <label for="inputName">Tên bệnh nhân:</label>
                                <input type="text" name="pname" class="form-control" id="inputName" placeholder="Nhập tên bệnh nhân">
                            </div>
                            <div class="form-group">
                                <label for="inputDOB">Ngày sinh:</label>
                                <input type="date" name="pdob" class="form-control" id="inputDOB">
                            </div>
                            <div class="form-group">
                                <label for="inputAddress">Địa chỉ:</label>
                                <input type="text" name="paddress" class="form-control" id="inputAddress" placeholder="Nhập địa chỉ">
                            </div>
                            <div class="form-group">
                                <label for="inputPhone">Số điện thoại:</label>
                                <input type="tel" name="pphone" class="form-control" id="inputPhone" placeholder="Nhập số điện thoại">
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            <button type="submit" name="btn" value="Add" class="btn btn-primary">Thêm</button>
                            <button type="submit" name="btn" value="Edit" class="btn btn-primary">Sửa</button>
                        </div></form>
                </div>
            </div>
        </div>
        <!-- Modal thêm chuẩn đoán -->
        <div class="modal fade" id="addDiagnosisModal" tabindex="-1" role="dialog" aria-labelledby="addDiagnosisModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addDiagnosisModalLabel">Thêm chuẩn đoán</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="addDiagnostic" method="post">
                        <div class="modal-body">
                            <input hidden type="text" name="pcreate" value="${sessionScope.user.getUsername()}" >

                            <div class="form-group">
                                <label for="inputPatient">Mã số bệnh nhân:</label>
                                <input type="text" name="pid" class="form-control " id="inputPatient" placeholder="Nhập mã số bệnh nhân">
                            </div>
                            <div class="form-group">
                                <label for="inputSymptoms">Triệu chứng:</label>
                                <textarea name="symptom" class="form-control form-control-lg" id="inputSymptoms" rows="2" placeholder="Nhập triệu chứng"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="inputDiagnosis">Chuẩn đoán:</label>
                                <textarea name="diagnosis"class="form-control form-control-lg" id="inputDiagnosis" rows="2" placeholder="Nhập chuẩn đoán"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="inputMedication">Thuốc:</label>
                                <textarea name="medication" class="form-control form-control-lg" id="inputMedication" rows="2" placeholder="Nhập thuốc"></textarea>
                            </div>
                            <div class="form-group">
                                <div class="form-check">
                                    <input name="admitted" class="form-check-input" type="checkbox" id="inputAdmitted">
                                    <label class="form-check-label" for="inputAdmitted">
                                        Phải nhập viện
                                    </label>
                                </div>
                            </div>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-primary">Thêm</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- The modal history -->
        <div class="modal fade" id="patientHistoryModal" tabindex="-1" role="dialog" aria-labelledby="patientHistoryModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="patientHistoryModalLabel">Lịch sử bệnh nhân</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="searchPatientInput">Tìm kiếm theo tên</label>
                                <input type="text" class="form-control" id="searchPatientInput" placeholder="Nhập tên bệnh nhân">
                            </div>
                        </form>
                        <div id="patientInfo">
                            <!-- Tên bệnh nhân và bảng hiển thị các chuẩn đoán sẽ được hiển thị tại đây -->
                        </div>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Ngày</th>
                                    <th>Triệu chứng</th>
                                    <th>Chuẩn đoán</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Ngày 1</td>
                                    <td>Triệu chứng 1</td>
                                    <td>Chuẩn đoán 1</td>
                                </tr>
                                <tr>
                                    <td>Ngày 2</td>
                                    <td>Triệu chứng 2</td>
                                    <td>Chuẩn đoán 2</td>
                                </tr>
                                <!-- Thêm các hàng dữ liệu chuẩn đoán trước đó tại đây -->
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="updateInformation" tabindex="-1" role="dialog" aria-labelledby="updateInformationLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="updateInformationLabel">Thay đổi thông tin</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="displayName">Tên hiển thị:</label>
                                <input type="text" class="form-control" id="displayName" placeholder="Nhập tên hiển thị">
                            </div>
                            <div class="form-group">
                                <label for="password">Mật khẩu:</label>
                                <input type="password" class="form-control" id="password" placeholder="Nhập mật khẩu">
                            </div>
                            <div class="form-group">
                                <label for="password">Nhập lại mật khẩu:</label>
                                <input type="password" class="form-control" id="re-password" placeholder="Nhập lại mật khẩu">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="button" class="btn btn-primary" id="saveChangesBtn">Lưu thay đổi</button>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <p>&copy; 2023 Bệnh viện XYZ. All rights reserved.</p>
        </footer>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>

                                            $(document).ready(function () {
                                                $("#add-patient").click(() => {
                                                    $("#inputName").val("");
                                                    $("#inputDOB").val("");
                                                    $("#inputAddress").val("");
                                                    $("#inputPhone").val("");
                                                    $("button[value='Edit']").hide();
                                                    $("button[value='Add']").show();
                                                });
                                                // Xử lý sự kiện nhấn nút "Sửa thông tin"
                                                $(".edit-button").click(function () {
                                                    $("button[value='Edit']").show();
                                                    $("button[value='Add']").hide();
                                                    const patient = $(this).data("patient");
                                                    console.log(patient);
                                                    // Lấy thông tin bệnh nhân từ thuộc tính data-patient
                                                    // var patient = JSON.parse($(this).data("patient"));
                                                    // Đẩy thông tin bệnh nhân vào modal "Thêm bệnh nhân"
                                                    $("#inputId").val(patient.id);
                                                    $("#inputName").val(patient.name);
                                                    $("#inputDOB").val(dateFormat(patient.dob));
                                                    $("#inputAddress").val(patient.address);
                                                    $("#inputPhone").val(patient.contact);
                                                });
                                            });
                                            const month = {
                                                "Jan": 1,
                                                "Feb": 2,
                                                "Mar": 3,
                                                "Apr": 4,
                                                "May": 5,
                                                "Jun": 6,
                                                "Jul": 7,
                                                "Aug": 8,
                                                "Sep": 9,
                                                "Oct": 10,
                                                "Nov": 11,
                                                "Dec": 12
                                            };
                                            const dateFormat = (date = "Jan 1, 2020") => {
                                                date = date.replace(",", "").split(" ")

                                                return date[2] + "-" + (Number(month[date[0]]) / 10 >= 1 ? month[date[0]] : ("0" + month[date[0]])) + "-" + (Number(date[1]) / 10 >= 1 ? date[1] : ("0" + date[1]));
                                            };
                                            console.log(dateFormat("Dec 13, 2002"));


        </script>
    </c:if>


</body>
</html>

