-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2020 at 07:31 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doantotnghiep`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `id_question` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `content` text NOT NULL,
  `content_text` text NOT NULL,
  `num_like` int(11) NOT NULL DEFAULT 0,
  `num_dislike` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `id_question`, `id_user`, `content`, `content_text`, `num_like`, `num_dislike`, `status`, `created_at`, `updated_at`) VALUES
(16, 26, 1, '<p>Nộp thuế thu nhập cá nhân chính là để cân bằng mức độ giàu nghèo giữa các tầng lớp tránh sự phân biệt đối sử giữa giàu và nghèo. Tăng trưởng kinh tế, thu hút nhân lực và bảo đảm tính cạnh tranh trong khu vực. Đây là trách nhiệm và nghĩa vụ của mỗi công dân nếu thuộc trường hợp phải đóng thuế TNCN</p>', 'Nộp thuế thu nhập cá nhân chính là để cân bằng mức độ giàu nghèo giữa các tầng lớp tránh sự phân biệt đối sử giữa giàu và nghèo. Tăng trưởng kinh tế, thu hút nhân lực và bảo đảm tính cạnh tranh trong khu vực. Đây là trách nhiệm và nghĩa vụ của mỗi công dân nếu thuộc trường hợp phải đóng thuế TNCN', 1, 0, 1, '2020-04-21 11:44:58', '2020-04-21 11:44:58');

--
-- Triggers `answer`
--
DELIMITER $$
CREATE TRIGGER `gam_num_answer` AFTER DELETE ON `answer` FOR EACH ROW UPDATE question SET question.num_answer = question.num_answer - 1 WHERE question.id = OLD.id_question
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tang_num_answer` AFTER INSERT ON `answer` FOR EACH ROW UPDATE question SET question.num_answer = question.num_answer + 1 WHERE question.id = NEW.id_question
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `dataset_answer`
--

CREATE TABLE `dataset_answer` (
  `id` int(11) NOT NULL,
  `class` varchar(255) DEFAULT NULL,
  `text_html` text NOT NULL,
  `text_tokenizer` text NOT NULL,
  `text` text NOT NULL,
  `feature` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dataset_answer`
--

INSERT INTO `dataset_answer` (`id`, `class`, `text_html`, `text_tokenizer`, `text`, `feature`) VALUES
(1, 'DESC:def', '<p>Khởi nghiệp (tiếng Anh: startup hoặc start-up) là thuật ngữ chỉ về những công ty đang trong giai đoạn bắt đầu kinh doanh nói chung (Startup company), nó thường được dùng với nghĩa hẹp chỉ các công ty công nghệ trong giai đoạn lập nghiệp. Khởi nghiệp là một tổ chức được thiết kế nhằm cung cấp sản phẩm và dịch vụ trong những điều kiện không chắc chắn nhất.</p>', 'khởi_nghiệp tiếng anh startup hoặc startup là thuật_ngữ chỉ về những công_ty đang trong giai_đoạn bắt_đầu kinh_doanh nói_chung startup company nó thường được dùng với nghĩa_hẹp chỉ các công_ty công_nghệ trong giai_đoạn lập_nghiệp khởi_nghiệp là một tổ_chức được thiết_kế nhằm cung_cấp sản_phẩm và dịch_vụ trong những điều_kiện không chắc_chắn nhất', 'Khởi nghiệp (tiếng Anh: startup hoặc start-up) là thuật ngữ chỉ về những công ty đang trong giai đoạn bắt đầu kinh doanh nói chung (Startup company), nó thường được dùng với nghĩa hẹp chỉ các công ty công nghệ trong giai đoạn lập nghiệp. Khởi nghiệp là một tổ chức được thiết kế nhằm cung cấp sản phẩm và dịch vụ trong những điều kiện không chắc chắn nhất.', 'khởi_nghiệp định_nghĩa'),
(2, 'DESC:manner', '<h4><strong>12 bước để khởi nghiệp</strong></h4><p>1. Xác định điều bạn muốn làm</p><p>2. Nghĩ về những gì người khác sẽ trả cho bạn</p><p>3. Phỏng vấn khách hàng lý tưởng</p><p>4. Lập kế hoạch kinh doanh và tiếp thị</p><p>5. Xây dựng ý tưởng kinh doanh trên quy mô nhỏ</p><p>6. Đánh giá thông tin phản hồi và điều chỉnh</p><p>7. Xây dựng đội ngũ cộng sự</p><p>8. Huy động vốn</p><p>9. Xác định loại hình và cơ cấu doanh nghiệp</p><p>10. Rời bỏ công việc hiện tại</p><p>11. Thiết lập ngân sách hoạt động</p><p>12. Mở rộng quy mô kinh doanh tùy theo kế hoạch tiếp thị</p>', '12 bước để khởi_nghiệp 1 xác_định điều bạn muốn làm 2 nghĩ về những gì người khác sẽ trả cho bạn 3 phỏng_vấn khách_hàng lý_tưởng 4 lập_kế hoạch kinh_doanh và tiếp_thị 5 xây_dựng ý_tưởng kinh_doanh trên quy_mô nhỏ 6 đánh_giá thông_tin phản_hồi và điều_chỉnh 7 xây_dựng đội_ngũ cộng_sự 8 huy_động vốn 9 xác_định loại_hình và cơ_cấu doanh_nghiệp 10 rời_bỏ công_việc hiện_tại 11 thiết_lập ngân_sách hoạt_động 12 mở_rộng quy_mô kinh_doanh tùy_theo kế_hoạch tiếp_thị', '12 bước để khởi nghiệp\n1. Xác định điều bạn muốn làm\n2. Nghĩ về những gì người khác sẽ trả cho bạn\n3. Phỏng vấn khách hàng lý tưởng\n4. Lập kế hoạch kinh doanh và tiếp thị\n5. Xây dựng ý tưởng kinh doanh trên quy mô nhỏ\n6. Đánh giá thông tin phản hồi và điều chỉnh\n7. Xây dựng đội ngũ cộng sự\n8. Huy động vốn\n9. Xác định loại hình và cơ cấu doanh nghiệp\n10. Rời bỏ công việc hiện tại\n11. Thiết lập ngân sách hoạt động\n12. Mở rộng quy mô kinh doanh tùy theo kế hoạch tiếp thị', 'quá_trình khởi_nghiệp'),
(3, 'DESC:desc', '<h4>8 yếu tố cần có để khởi nghiệp thành công</h4><p>1. Năng lực sáng tạo</p><p>2. Sự kiên trì</p><p>3. Vốn khởi nghiệp kinh doanh</p><p>4. Kiến thức nền tảng cơ bản</p><p>5. Kỹ năng nghiên cứu thị trường</p><p>6. Kỹ năng quản lý tài chính</p><p>7. Kỹ năng ủy quyền</p><p>8. Kỹ năng hoạch định chiến lược</p>', '8 yếu_tố cần phải có để khởi_nghiệp thành_công 1 năng_lực sáng_tạo 2 sự kiên_trì 3 vốn khởi_nghiệp kinh_doanh 4 kiến_thức nền_tảng cơ_bản 5 kỹ_năng nghiên_cứu thị_trường 6 kỹ_năng quản_lý tài_chính 7 kỹ_năng ủy quyền 8 kỹ_năng hoạch_định chiến_lược', '8 yếu tố cần phải có để khởi nghiệp thành công\n1. Năng lực sáng tạo\n2. Sự kiên trì\n3. Vốn khởi nghiệp kinh doanh\n4. Kiến thức nền tảng cơ bản\n5. Kỹ năng nghiên cứu thị trường\n6. Kỹ năng quản lý tài chính\n7. Kỹ năng ủy quyền\n8. Kỹ năng hoạch định chiến lược', 'phẩm_chất khởi_nghiệp'),
(4, 'DESC:reason', '<h4><strong>4 lí do để khởi nghiệp</strong></h4><p class=\"ql-align-justify\">1. Làm mới bản thân</p><p class=\"ql-align-justify\">2. Học hỏi nhiều điều mới và đa năng hơn</p><p class=\"ql-align-justify\">3. Được sống và làm việc với chính mình</p><p class=\"ql-align-justify\">4. Thay đổi cuộc sống của mình và mọi người</p>', '4 lí_do để khởi_nghiệp 1 làm mới bản_thân 2 học_hỏi nhiều điều mới và đa_năng hơn 3 được sống và làm_việc với chính mình 4 thay_đổi cuộc_sống của mình và mọi người', '4 lí do để khởi nghiệp\n1. Làm mới bản thân\n2. Học hỏi nhiều điều mới và đa năng hơn\n3. Được sống và làm việc với chính mình\n4. Thay đổi cuộc sống của mình và mọi người', 'lí_do khởi_nghiệp'),
(5, 'DESC:desc', '<h4 class=\"ql-align-justify\">Mọi dự án khởi nghiệp đều có 2 đặc điểm chung:</h4><p class=\"ql-align-justify\"><strong><em>Tính đột phá</em></strong>: Mọi dự án khởi nghiệp thường tạo ra những điều chưa từng có trên thị trường hoặc những thứ thị trường đã có nhưng tốt hơn, thậm chí là vượt bậc. Đó có thể là một mô hình kinh doanh mới, một phân khúc sản xuất mới hay một công nghệ chưa từng thấy trên thế giới.</p><p class=\"ql-align-justify\"><strong><em>Tăng trưởng</em></strong>: Mọi công ty khởi nghiệp ( hay&nbsp;<strong>Startup</strong>) đều không đặt mục tiêu, giới hạn sự tăng trưởng cho mình. Họ thường hoạt động với khát vọng đạt được sự phát triển tốt nhất có thể.</p>', 'mọi dự_án khởi_nghiệp đều có 2 đặc_điểm chung tính đột_phá mọi dự_án khởi_nghiệp thường tạo_ra những điều chưa_từng có trên thị_trường hoặc những thứ thị_trường đã có nhưng tốt hơn thậm_chí là vượt_bậc đó có_thể là một mô_hình kinh_doanh mới một phân khúc sản_xuất mới_hay một công_nghệ chưa_từng thấy trên thế_giới tăng_trưởng mọi công_ty khởi_nghiệp _hay startup đều không đặt mục_tiêu giới_hạn sự tăng_trưởng cho mình họ thường hoạt_động với khát_vọng đạt_được sự phát_triển tốt nhất có_thể', 'Mọi dự án khởi nghiệp đều có 2 đặc điểm chung:\nTính đột phá: Mọi dự án khởi nghiệp thường tạo ra những điều chưa từng có trên thị trường hoặc những thứ thị trường đã có nhưng tốt hơn, thậm chí là vượt bậc. Đó có thể là một mô hình kinh doanh mới, một phân khúc sản xuất mới hay một công nghệ chưa từng thấy trên thế giới.\nTăng trưởng: Mọi công ty khởi nghiệp ( hay Startup) đều không đặt mục tiêu, giới hạn sự tăng trưởng cho mình. Họ thường hoạt động với khát vọng đạt được sự phát triển tốt nhất có thể.', 'đặc_điểm khởi_nghiệp'),
(6, 'DESC:desc', '<p>Mục tiêu của khởi nghiệp là tạo ra giá trị có lợi cho người cho xã hội hoặc nhóm khởi nghiệp, cho các cổ đông của công ty, cho người lao động, cho cộng đồng và nhà nước.</p>', 'mục_tiêu của khởi_nghiệp là tạo_ra giá_trị có_lợi cho người cho xã_hội hoặc nhóm khởi_nghiệp cho các cổ_đông của_công ty cho người lao_động cho cộng_đồng và nhà_nước', 'Mục tiêu của khởi nghiệp là tạo ra giá trị có lợi cho người cho xã hội hoặc nhóm khởi nghiệp, cho các cổ đông của công ty, cho người lao động, cho cộng đồng và nhà nước.', 'mục_tiêu khởi_nghiệp'),
(7, 'HUM:desc', '<p>Hầu như bất cứ người trưởng thành nào cũng có thể khởi nghiệp nếu muốn, không phân biệt già hay trẻ, nam hay nữ, không phân biệt trong hay ngoài nước, thành thị hay nông thôn miễn sao bạn có một ý tưởng hay có thể thực hiện được, có thể đem lại lợi ích cho bản thân mình và toàn xã hội.</p>', 'hầu_như bất_cứ người trưởng_thành nào cũng có_thể khởi_nghiệp nếu muốn không phân_biệt già hay trẻ nam hay nữ không phân_biệt trong hay ngoài nước thành_thị hay nông_thôn miễn_sao bạn có_một ý_tưởng hay có_thể thực_hiện được có_thể đem lại lợi_ích cho bản_thân mình và toàn xã_hội', 'Hầu như bất cứ người trưởng thành nào cũng có thể khởi nghiệp nếu muốn, không phân biệt già hay trẻ, nam hay nữ, không phân biệt trong hay ngoài nước, thành thị hay nông thôn miễn sao bạn có một ý tưởng hay có thể thực hiện được, có thể đem lại lợi ích cho bản thân mình và toàn xã hội.', 'người khởi_nghiệp'),
(8, 'DESC:desc', '<p>Một số lĩnh vực khởi nghiệp như các dịch vụ sức khỏe, thanh toán trên di động, nông nghiệp sạch, công nghệ 4.0 ...Tuy nhiên bất kì lĩnh vực nào cũng không quan trọng bằng cách bạn thực hiện nó.&nbsp;</p>', 'một_số lĩnh_vực khởi_nghiệp như các dịch_vụ sức_khỏe thanh_toán trên di_động nông_nghiệp sạch công_nghệ 40 tuy_nhiên bất_kì lĩnh_vực nào cũng không quan_trọng bằng cách bạn thực_hiện nó', 'Một số lĩnh vực khởi nghiệp như các dịch vụ sức khỏe, thanh toán trên di động, nông nghiệp sạch, công nghệ 4.0 ...Tuy nhiên bất kì lĩnh vực nào cũng không quan trọng bằng cách bạn thực hiện nó. ', 'lĩnh_vực khởi_nghiệp'),
(9, 'NUM:money', '<p>Rất khó có thể đưa ra một mức cụ thể mà bạn có thể áp dụng được. Tuy nhiên bạn cần tính toán một số lượng đủ để bạn duy trì hoạt động trong 6-9 tháng liên tục không có thu nhập. Bạn sẽ luôn thấy rất lâu sau mới có doanh thu và bạn sẽ có nhiều khoản chi phí hơn dự tính ban đầu.&nbsp;</p>', 'rất khó có_thể đưa_ra một_mức cụ_thể mà bạn có_thể áp_dụng được tuy_nhiên bạn cần tính_toán một_số lượng đủ để bạn duy_trì hoạt_động trong 69 tháng liên_tục không có thu_nhập bạn sẽ luôn thấy rất lâu sau mới có doanh_thu và bạn sẽ có nhiều khoản chi_phí hơn dự_tính ban_đầu', 'Rất khó có thể đưa ra một mức cụ thể mà bạn có thể áp dụng được. Tuy nhiên bạn cần tính toán một số lượng đủ để bạn duy trì hoạt động trong 6-9 tháng liên tục không có thu nhập. Bạn sẽ luôn thấy rất lâu sau mới có doanh thu và bạn sẽ có nhiều khoản chi phí hơn dự tính ban đầu. ', 'tiền khởi_nghiệp'),
(10, 'DESC:reason', '<h4>5 nguyên nhân chính dẫn đến khởi nghiệp thất bại</h4><p>1. Khởi nghiệp thất bại vì thiếu vốn</p><p class=\"ql-align-justify\">2.  Định vị sai sản phẩm, dịch vụ</p><p>3. Kinh nghiệm vận hành doanh nghiệp</p><p>4. Quản lý chi phí kém hiệu quả</p><p>5. Không tìm được những cộng sự ưng ý</p>', '5 nguyên_nhân chính dẫn đến khởi_nghiệp thất_bại 1 khởi_nghiệp thất_bại vì thiếu vốn 2 định_vị sai sản_phẩm dịch_vụ 3 kinh_nghiệm vận_hành doanh_nghiệp 4 quản_lý chi_phí kém hiệu_quả 5 không tìm được những cộng_sự ưng_ý', '5 nguyên nhân chính dẫn đến khởi nghiệp thất bại\n1. Khởi nghiệp thất bại vì thiếu vốn\n2.  Định vị sai sản phẩm, dịch vụ\n3. Kinh nghiệm vận hành doanh nghiệp\n4. Quản lý chi phí kém hiệu quả\n5. Không tìm được những cộng sự ưng ý', 'lí_do khởi_nghiệp thất_bại'),
(13, 'DESC:reason', '<p>Nộp thuế thu nhập cá nhân chính là để cân bằng mức độ giàu nghèo giữa các tầng lớp tránh sự phân biệt đối sử giữa giàu và nghèo. Tăng trưởng kinh tế, thu hút nhân lực và bảo đảm tính cạnh tranh trong khu vực. Đây là trách nhiệm và nghĩa vụ của mỗi công dân nếu thuộc trường hợp phải đóng thuế TNCN</p>', 'nộp thuế thu_nhập cá_nhân chính là để cân_bằng mức_độ giàu nghèo giữa các tầng_lớp tránh sự phân_biệt đối sử giữa giàu và nghèo tăng_trưởng kinh_tế thu_hút nhân_lực và bảo_đảm tính cạnh_tranh trong khu_vực đây là trách_nhiệm và nghĩa_vụ của mỗi công_dân nếu thuộc trường_hợp phải đóng thuế tncn', 'Nộp thuế thu nhập cá nhân chính là để cân bằng mức độ giàu nghèo giữa các tầng lớp tránh sự phân biệt đối sử giữa giàu và nghèo. Tăng trưởng kinh tế, thu hút nhân lực và bảo đảm tính cạnh tranh trong khu vực. Đây là trách nhiệm và nghĩa vụ của mỗi công dân nếu thuộc trường hợp phải đóng thuế TNCN', 'lí_do đóng thuế thu_nhập cá_nhân'),
(15, 'DESC:reason', '<p>Để khởi nghiệp, bạn không nhất thiết phải thành lập doanh nghiệp. Tuy nhiên việc đầu tư kinh doanh buộc phải luôn được thực hiện dưới một hình thức pháp lý nhất định. Bạn không thể kinh doanh với tư cách cá nhân hoặc sẽ bị phạt dưới nhiều hình thức và mức độ từ cảnh cáo, phạt tiền đến truy cứu trách nhiệm hình sự.</p>', 'để khởi_nghiệp bạn không nhất_thiết phải thành_lập doanh_nghiệp tuy_nhiên việc đầu_tư kinh_doanh buộc phải luôn được thực_hiện dưới một hình_thức pháp_lý nhất_định bạn không_thể kinh_doanh với tư_cách cá_nhân hoặc sẽ bị phạt dưới nhiều hình_thức và mức_độ từ cảnh_cáo phạt_tiền đến truy_cứu trách_nhiệm hình_sự', 'Để khởi nghiệp, bạn không nhất thiết phải thành lập doanh nghiệp. Tuy nhiên việc đầu tư kinh doanh buộc phải luôn được thực hiện dưới một hình thức pháp lý nhất định. Bạn không thể kinh doanh với tư cách cá nhân hoặc sẽ bị phạt dưới nhiều hình thức và mức độ từ cảnh cáo, phạt tiền đến truy cứu trách nhiệm hình sự.', 'lí_do thành_lập doanh_nghiệp khởi_nghiệp kinh_doanh'),
(16, 'DESC:def', '<p>Thuế là một khoản phí tài chính bắt buộc hoặc một số loại thuế khác áp dụng cho người nộp thuế (một cá nhân hoặc pháp nhân) phải trả cho một tổ chức chính phủ để tài trợ cho các khoản chi tiêu công khác nhau</p>', 'thuế là một khoản phí tài_chính bắt_buộc hoặc một_số loại thuế khác áp_dụng cho người nộp thuế một cá_nhân hoặc pháp_nhân phải trả cho một tổ_chức chính_phủ để tài_trợ cho các khoản chi_tiêu công khác_nhau', 'Thuế là một khoản phí tài chính bắt buộc hoặc một số loại thuế khác áp dụng cho người nộp thuế (một cá nhân hoặc pháp nhân) phải trả cho một tổ chức chính phủ để tài trợ cho các khoản chi tiêu công khác nhau', 'thuế định_nghĩa'),
(17, 'DESC:def', '<p>Thuế thu nhập cá nhân là khoản tiền thuế mà người có thu nhập phải trích nộp một phần tiền lương hoặc từ các nguồn thu khác vào ngân sách nhà nước sau khi đã tính các khoản được giảm trừ.</p>', 'thuế thu_nhập cá_nhân là khoản tiền thuế mà người có thu_nhập phải trích nộp một phần tiền_lương hoặc từ các nguồn thu khác vào ngân_sách nhà_nước sau khi đã tính các khoản được giảm trừ', 'Thuế thu nhập cá nhân là khoản tiền thuế mà người có thu nhập phải trích nộp một phần tiền lương hoặc từ các nguồn thu khác vào ngân sách nhà nước sau khi đã tính các khoản được giảm trừ.', 'thuế thu_nhập cá_nhân định_nghĩa');

-- --------------------------------------------------------

--
-- Table structure for table `dataset_question`
--

CREATE TABLE `dataset_question` (
  `id` int(11) NOT NULL,
  `class` varchar(255) NOT NULL,
  `question` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dataset_question`
--

INSERT INTO `dataset_question` (`id`, `class`, `question`) VALUES
(1, 'DESC:def', 'khởi_nghiệp nghĩa_là gì'),
(2, 'DESC:def', 'khởi_nghiệp nghĩa_là'),
(3, 'DESC:def', 'khởi_nghiệp là gì'),
(4, 'DESC:def', 'định_nghĩa khởi_nghiệp'),
(5, 'DESC:def', 'khởi_nghiệp được định_nghĩa như_thế_nào'),
(6, 'DESC:def', 'định_nghĩa của khởi_nghiệp'),
(7, 'DESC:def', 'định_nghĩa về khởi_nghiệp'),
(8, 'DESC:def', 'thế_nào là khởi_nghiệp'),
(9, 'DESC:def', 'nghĩa của từ khởi_nghiệp'),
(10, 'DESC:def', 'mô_tả về khởi_nghiệp'),
(11, 'DESC:def', 'mô_tả khởi_nghiệp'),
(12, 'DESC:def', 'khởi_nghiệp được mô_tả như_thế_nào'),
(13, 'DESC:def', 'khởi_nghiệp được mô_tả như_nào'),
(14, 'DESC:def', 'khởi_nghiệp mô_tả như_nào'),
(15, 'DESC:def', 'giới_thiệu về khởi_nghiệp'),
(16, 'DESC:def', 'khởi_nghiệp được mô_tả như_thế_nào'),
(17, 'DESC:def', 'startup mô_tả như_thế_nào'),
(18, 'DESC:def', 'startup là gì'),
(19, 'DESC:def', 'start_up là gì'),
(20, 'DESC:def', 'nghĩa của từ startup là gì'),
(21, 'DESC:def', 'nghĩa của từ startup'),
(22, 'DESC:def', 'startup nghĩa_là gì'),
(23, 'DESC:def', 'start_up nghĩa_là gì'),
(26, 'DESC:def', 'định_nghĩa về startup'),
(27, 'DESC:def', 'định_nghĩa về start_up'),
(28, 'DESC:def', 'định_nghĩa thế_nào là startup'),
(29, 'DESC:def', 'định_nghĩa về startup'),
(30, 'DESC:def', 'định_nghĩa của startup'),
(31, 'DESC:def', 'định_nghĩa của start_up'),
(33, 'DESC:manner', 'làm thế_nào để khởi_nghiệp'),
(34, 'DESC:manner', 'làm sao để khởi_nghiệp'),
(35, 'DESC:manner', 'cách để khởi_nghiệp'),
(36, 'DESC:manner', 'cách_thức để khởi_nghiệp'),
(37, 'DESC:manner', 'các bước để khởi_nghiệp'),
(38, 'DESC:manner', 'quá_trình để khởi_nghiệp'),
(39, 'DESC:manner', 'quá_trình thực_hiện khởi_nghiệp'),
(40, 'DESC:manner', 'khởi_nghiệp bắt_đầu từ đâu'),
(41, 'DESC:manner', 'khởi_nghiệp bắt_đầu như_thế_nào'),
(42, 'DESC:manner', 'cần gì để khởi_nghiệp'),
(43, 'DESC:manner', 'cần gì để bắt_đầu khởi_nghiệp'),
(44, 'DESC:manner', 'cần gì để khởi nghiệp'),
(45, 'DESC:desc', 'khởi_nghiệp cần những yếu_tố nào'),
(46, 'DESC:desc', 'yếu_tố cần_thiết để khởi_nghiệp'),
(47, 'DESC:desc', 'bắt_đầu khởi_nghiệp cần những yếu_tố nào'),
(48, 'DESC:desc', 'người khởi_nghiệp cần những yếu_tố nào'),
(49, 'DESC:desc', 'tố_chất cần có để trở thành người khởi_nghiệp là gì'),
(50, 'DESC:desc', 'người khởi_nghiệp cần những yếu_tố nào'),
(51, 'DESC:desc', 'người khởi_nghiệp cần những tố_chất nào'),
(52, 'DESC:desc', 'tố_chất của người khởi_nghiệp là gì'),
(53, 'DESC:desc', 'đặc_điểm của khởi_nghiệp là gì'),
(54, 'DESC:desc', 'đặc_điểm của khởi_nghiệp'),
(55, 'DESC:desc', 'khởi_nghiệp có những đặc_điểm gì'),
(56, 'DESC:desc', 'đặc_điểm chung của khởi_nghiệp'),
(57, 'DESC:desc', 'một_số đặc_điểm của khởi_nghiệp'),
(58, 'DESC:desc', 'mục_tiêu của khởi_nghiệp là gì'),
(59, 'DESC:desc', 'những mục_tiêu của khởi_nghiệp'),
(60, 'DESC:desc', 'mục_tiêu của khởi_nghiệp'),
(61, 'DESC:desc', 'khởi_nghiệp có mục_tiêu gì'),
(62, 'DESC:desc', 'các mục_tiêu của khởi_nghiệp'),
(63, 'DESC:reason', 'vì_sao phải khởi_nghiệp'),
(64, 'DESC:reason', 'tại_sao phải khởi_nghiệp'),
(65, 'DESC:reason', 'vì_sao nên khởi_nghiệp'),
(66, 'DESC:reason', 'tại_sao nên khởi_nghiệp'),
(67, 'DESC:reason', 'lí_do để khởi_nghiệp là gì'),
(68, 'DESC:reason', 'lí_do nên khởi_nghiệp là gì'),
(72, 'DESC:reason', 'có_nên khởi_nghiệp hay không'),
(75, 'DESC:reason', 'khởi_nghiệp hay không'),
(76, 'HUM:desc', 'đối_tượng bắt_đầu khởi_nghiệp gồm những_ai'),
(77, 'HUM:desc', 'ai có_thể bắt_đầu khởi_nghiệp'),
(78, 'HUM:desc', 'người nào có_thể khởi_nghiệp'),
(79, 'HUM:desc', 'ai có_thể khởi_nghiệp'),
(80, 'HUM:desc', 'đối_tượng khởi_nghiệp '),
(81, 'HUM:desc', 'đối_tượng nào có_thể khởi_nghiệp'),
(82, 'DESC:desc', 'lĩnh_vực nào có_thể khởi_nghiệp'),
(83, 'DESC:desc', 'lĩnh_vực bắt_đầu khởi_nghiệp'),
(84, 'DESC:desc', 'lĩnh_vực nào cho người mới bắt_đầu khởi_nghiệp'),
(85, 'DESC:desc', 'lĩnh_vực để khởi_nghiệp'),
(86, 'DESC:desc', 'một_số lĩnh_vực để khởi_ngiệp'),
(87, 'NUM:money', 'tôi nên dành ra số vốn bao_nhiêu khi bắt_đầu khởi_nghiệp'),
(88, 'NUM:money', 'số vốn để bắt_đầu khởi_nghiệp là bao_nhiêu'),
(89, 'NUM:money', 'cần bao_nhiêu tiền để bắt_đầu khởi_nghiệp'),
(90, 'NUM:money', 'mới khởi_nghiệp thì cần bao_nhiêu tiền'),
(91, 'NUM:money', 'bao_nhiêu tiền thì có_thể khởi_nghiệp'),
(92, 'NUM:money', 'vốn ban_đầu để khởi_nghiệp là bao_nhiêu'),
(94, 'NUM:money', 'số vốn để bắt_đầu khởi_nghiệp là bao_nhiêu'),
(95, 'NUM:money', 'cần bao_nhiêu tiền để bắt_đầu khởi_nghiệp'),
(96, 'NUM:money', 'mới khởi_nghiệp thì cần bao_nhiêu tiền'),
(97, 'NUM:money', 'bao_nhiêu tiền thì có_thể khởi_nghiệp'),
(98, 'NUM:money', 'vốn ban_đầu để khởi_nghiệp là bao_nhiêu'),
(105, 'DESC:reason', 'tại_sao khởi_nghiệp thất_bại'),
(106, 'DESC:reason', 'tại_sao khởi_nghiệp thường thất_bại'),
(107, 'DESC:reason', 'tại_sao khởi_nghiệp dễ thất_bại'),
(108, 'DESC:reason', 'tại_sao khởi_nghiệp hay thất_bại'),
(109, 'DESC:reason', 'vì_sao khởi_nghiệp hay thất_bại'),
(110, 'DESC:reason', 'vì_sao khởi_nghiệp thường thất_bại'),
(111, 'DESC:reason', 'vì_sao khởi_nghiệp dễ thất_bại'),
(113, 'DESC:desc', 'tôi muốn khởi_nghiệp vậy tôi cần phải có những phẩm_chất gì'),
(114, 'NUM:money', 'số vốn để khởi_nghiệp'),
(115, 'NUM:money', 'số tiền để khởi_nghiệp'),
(120, 'DESC:reason', 'tại_sao phải đóng thuế thu_nhập cá_nhân'),
(121, 'DESC:desc', 'mục_đích của khởi_nghiệp'),
(122, 'DESC:reason', 'vì_sao phải nộp thuế tncn'),
(123, 'DESC:reason', 'vì_sao phải nộp thuế thu_nhập cá_nhân'),
(124, 'DESC:reason', 'tại_sao mọi người phải nộp thuế thu_nhập cá_nhân'),
(125, 'DESC:reason', 'tại_sao mọi người phải nộp thuế tncn'),
(126, 'DESC:reason', 'tại_sao người dân phải nộp thuế thu_nhập cá_nhân'),
(127, 'DESC:reason', 'tại_sao người dân phải nộp thuế tncn'),
(128, 'DESC:reason', 'vì_sao người dân phải nộp thuế tncn'),
(129, 'DESC:reason', 'nguyên_nhân khởi_nghiệp thất_bại là gì'),
(130, 'DESC:reason', 'nguyên_nhân nào dẫn đến khởi_nghiệp thất_bại'),
(131, 'DESC:reason', 'nguyên_nhân khởi_nghiệp thất_bại là gì'),
(132, 'DESC:reason', 'nguyên_nhân nào dẫn đến khởi_nghiệp thất_bại'),
(133, 'DESC:reason', 'tại_sao phải thành_lập doanh_nghiệp để khởi_nghiệp'),
(134, 'DESC:reason', 'tại_sao khởi_nghiệp phải thành_lập doanh_nghiệp'),
(135, 'DESC:def', 'thuế là gì'),
(136, 'DESC:def', 'thuế nghĩa là gì'),
(137, 'DESC:def', 'thuế được đinh nghĩa như thế nào'),
(138, 'DESC:def', 'định nghĩa về thuế'),
(139, 'DESC:def', 'thuế có nghĩa là gì'),
(140, 'DESC:def', 'thuế tncn là gì'),
(141, 'DESC:def', 'thuế tncn được hiểu là gì'),
(142, 'DESC:def', 'thuế tncn được hiểu như thế nào'),
(143, 'DESC:def', 'thuế thu_nhập cá_nhân là gì'),
(144, 'DESC:def', 'thuế thu_nhập cá_nhân được hiểu là gì'),
(145, 'DESC:def', 'định_nghĩa thuế thu_nhập cá_nhân là gì'),
(146, 'DESC:manner', 'các_bước để có_thể khởi_nghiệp'),
(147, 'DESC:manner', 'các_bước để tôi có_thể khởi_nghiệp'),
(148, 'DESC:desc', 'ngành khởi_nghiệp'),
(149, 'DESC:desc', 'các ngành_nghề có_thể khởi_nghiệp'),
(150, 'DESC:desc', 'ngành_nghề khởi_nghiệp'),
(151, 'DESC:desc', 'các ngành_nghề để khởi_nghiệp'),
(152, 'DESC:manner', 'khởi_nghiệp cần chuẩn_bị gì'),
(153, 'DESC:manner', 'khởi_nghiệp cần chuẩn_bị những gì'),
(154, 'DESC:manner', 'bắt_đầu khởi_nghiệp cần chuẩn_bị những gì'),
(155, 'DESC:reason', 'có_nên khởi_nghiệp hay_không');

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_question` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `favorite`
--

INSERT INTO `favorite` (`id`, `id_user`, `id_question`) VALUES
(35, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `image` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `post_by` varchar(255) DEFAULT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `image`, `title`, `slug`, `content`, `post_by`, `view`, `created_at`, `updated_at`) VALUES
(2, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/chuong-trinh-thanh-vien-than-thiet-oded8j6cejx6axo40aj9rgzsqdtti782knnag02v9s.jpg', 'Chương trình thành viên thân thiết (VIP member)', 'chuong-trinh-thanh-vien-than-thiet-vip-member', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/chuong-trinh-thanh-vien-than-thiet-vip-member.html', 'div.content-single article', 14, '2019-10-02 08:55:27', '2020-03-10 09:33:26'),
(3, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/trai-phieu-dau-tu-uu-dai-dich-vu-oaxw93pludt118vzjmfx4vo4ztk8sk8ip66720rbgw.png', 'Startup Fintech Findi &#8211; Giấc mơ về một nền tảng gọi vốn bằng trái phiếu cho các Startup', 'startup-fintech-findi-giac-mo-ve-mot-nen-tang-goi-von-bang-trai-phieu-cho-cac-startup', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/startup-fintech-findi-giac-mo-ve-mot-nen-tang-goi-von-bang-trai-phieu-cho-cac-startup.html', 'div.content-single article', 3, '2019-10-02 08:55:27', '2020-03-23 20:06:41'),
(4, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/trai-phieu-dau-tu-oaa3ai3lh3nrpz3uds521f5ymq8sv0hpgvkp0991w0.png', 'Findi.vn &#8211; Startup nền tảng phát hành trái phiếu đầu tư cho doanh nghiệp nhỏ, startup', 'findi-vn-startup-nen-tang-phat-hanh-trai-phieu-dau-tu-cho-doanh-nghiep-nho-startup', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/findi-vn-startup-nen-tang-phat-hanh-trai-phieu-dau-tu-cho-doanh-nghiep-nho-startup.html', 'div.content-single article', 2, '2019-10-02 08:55:27', '2020-03-03 16:53:24'),
(5, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/nguoi-sang-lap-que-yen-bai-o7rhlmg4sxbu1dhgugkz6o5sekt8p0qnxhgjjocxxs.jpg', 'Startup Quế Việt &#8211; Giấc mơ đưa cây quế Yên Bái trở thành thương hiệu quốc gia, vươn tầm thế giới', 'startup-que-viet-giac-mo-dua-cay-que-yen-bai-tro-thanh-thuong-hieu-quoc-gia-vuon-tam-the-gioi', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/startup-que-viet-giac-mo-dua-cay-que-yen-bai-tro-thanh-thuong-hieu-quoc-gia-vuon-tam-the-gioi.html', 'div.content-single article', 3, '2019-10-02 08:55:27', '2020-05-05 22:53:38'),
(6, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/capp-o6s7hc4fye86eck9kdwe1ja6rs02g7hp39ztra7r2o.png', 'ĐÊM GALA CHUNG KẾT CUỘC THI “TÌM KIẾM CEO TƯƠNG LAI” LẦN 09 &#8211; NĂM 2019', 'dem-gala-chung-ket-cuoc-thi-tim-kiem-ceo-tuong-lai-lan-09-nam-2019', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/dem-gala-chung-ket-cuoc-thi-tim-kiem-ceo-tuong-lai-lan-09-nam-2019.html', 'div.content-single article', 0, '2019-10-02 08:55:27', '2019-10-02 08:55:27'),
(7, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/ur-o5wiifrm5hscao584j9ipn5omgy6y4zntek1s0dkuo.jpg', 'TÌM KIẾM CEO TƯƠNG LAI LẦN 09 &#8211;  NĂM 2019 RECAP SAU CHẶNG PITCHING &#8211; PHỎNG VẤN NHÓM', 'tim-kiem-ceo-tuong-lai-lan-09-nam-2019-recap-sau-chang-pitching-phong-van-nhom', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/tim-kiem-ceo-tuong-lai-lan-09-nam-2019-recap-sau-chang-pitching-phong-van-nhom.html', 'div.content-single article', 4, '2019-10-02 08:55:27', '2020-05-05 18:02:12'),
(8, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/urc2-o5nts9dhj26vet9xz4j7flsarz2nyot0mlkbwwzm4w.png', 'CUỘC THI TÌM KIẾM CEO TƯƠNG LAI LẦN 09 &#8211; NĂM 2019 RECAP CHẶNG HỌC TẠI DOANH NGHIỆP', 'cuoc-thi-tim-kiem-ceo-tuong-lai-lan-09-nam-2019-recap-chang-hoc-tai-doanh-nghiep', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/cuoc-thi-tim-kiem-ceo-tuong-lai-lan-09-nam-2019-recap-chang-hoc-tai-doanh-nghiep.html', 'div.content-single article', 4, '2019-10-02 08:55:27', '2020-03-15 09:11:06'),
(9, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/anh-1-o531c7tz6ttsgr029ey2nu9bk6txr0tnhyvsa36uhc.png', 'CUỘC THI TÌM KIẾM CEO TƯƠNG LAI LẦN 09 &#8211; NĂM 2019 ĐÃ CHÍNH THỨC BẮT ĐẦU VỚI VÒNG 1: VÒNG SƠ LOẠI', 'cuoc-thi-tim-kiem-ceo-tuong-lai-lan-09-nam-2019-da-chinh-thuc-bat-dau-voi-vong-1-vong-so-loai', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/cuoc-thi-tim-kiem-ceo-tuong-lai-lan-09-nam-2019-da-chinh-thuc-bat-dau-voi-vong-1-vong-so-loai.html', 'div.content-single article', 1, '2019-10-02 08:55:27', '2020-03-03 16:40:09'),
(10, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/bepos-slide-03-o4uj4arttywx2buw79kisorjeqbl3ymr6n0g5kgp1s.jpg', 'bePOS &#8211; Phần Mềm Quản Lý Bán Hàng 4.0 &#8211; Nhiều hơn 30% khách hàng, nhanh hơn 55 % thời gian!', 'bepos-phan-mem-quan-ly-ban-hang-4-0-nhieu-hon-30-khach-hang-nhanh-hon-55-thoi-gian', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/bepos-phan-mem-quan-ly-ban-hang-4-0-nhieu-hon-30-khach-hang-nhanh-hon-55-thoi-gian.html', 'div.content-single article', 0, '2019-10-02 08:55:27', '2019-10-02 08:55:27'),
(11, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/timthumb-o3x8gam5or2nbcjvlkolky1wgx248e5z01pyi2dck0.png', 'SỰ TRỞ LẠI CỦA CUỘC THI “TÌM KIẾM CEO TƯƠNG LAI” LẦN 09 &#8211; NĂM 2019', 'su-tro-lai-cua-cuoc-thi-tim-kiem-ceo-tuong-lai-lan-09-nam-2019', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/su-tro-lai-cua-cuoc-thi-tim-kiem-ceo-tuong-lai-lan-09-nam-2019.html', 'div.content-single article', 0, '2019-10-02 08:55:27', '2019-10-02 08:55:27'),
(12, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/dich-vu-xay-dung-ke-hoach-kinh-doanh-o3lur7eb4wojysfdx76k1ts3xxfy8rax6tzsvuzqhc.jpg', 'Xây dựng kế hoạch kinh doanh chỉ với 500k', 'xay-dung-ke-hoach-kinh-doanh-chi-voi-500k', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/xay-dung-ke-hoach-kinh-doanh-chi-voi-500k.html', 'div.content-single article', 0, '2019-10-02 08:55:27', '2019-10-02 08:55:27'),
(13, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/huong-dan-su-dung-san-goi-von-o3hzcmdjpwma9877xe04vqz8s3ek5uvfj5d5663hsg.png', 'Hướng dẫn sử dụng sàn gọi vốn hiệu quả', 'huong-dan-su-dung-san-goi-von-hieu-qua', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/huong-dan-su-dung-san-goi-von-hieu-qua.html', 'div.content-single article', 0, '2019-10-02 08:55:27', '2019-10-02 08:55:27'),
(14, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/tim-nha-dau-tu-va-goi-von-findi.vn_-o3hwo57w92jsm2c6a6pnglf1tcxb48v8lmu0wr56fk.png', 'Findi.vn – Nền tảng tìm nhà đầu tư và phát triển dự án chuyên nghiệp', 'findi-vn-nen-tang-tim-nha-dau-tu-va-phat-trien-du-an-chuyen-nghiep', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/findi-vn-nen-tang-tim-nha-dau-tu-va-phat-trien-du-an-chuyen-nghiep.html', 'div.content-single article', 0, '2019-10-02 08:55:27', '2019-10-02 08:55:27'),
(15, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/ii-o0gbw4myvyt07qpqpplottyzz02rmx09rexxrdrxe8.png', 'Startup Findi – Nền tảng đầu tư dự án chuyên nghiệp', 'startup-findi-nen-tang-dau-tu-du-an-chuyen-nghiep', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/startup-findi-nen-tang-dau-tu-du-an-chuyen-nghiep.html', 'div.content-single article', 1, '2019-10-02 08:55:27', '2020-03-15 09:10:42'),
(16, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/doi-thoa-cung-sgarktank-nugleu7hgqo4btkg5h1mdq41b5taxm10946oinj7bk.png', 'Đối thoại cùng SharkTank', 'doi-thoai-cung-sharktank', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/doi-thoai-cung-sharktank.html', 'div.content-single article', 0, '2019-10-02 08:55:27', '2019-10-02 08:55:27'),
(17, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/photo1528367699577-15283676995771863905761-ntqgkhdevgpe3c5f8tpvcsi7nkhna3266ezjnvg5hs.png', 'Startup Jupviec.vn gọi vốn series A thành công từ Quỹ đầu tư Mỹ', 'startup-jupviec-vn-goi-von-series-a-thanh-cong-tu-quy-dau-tu-my', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/startup-jupviec-vn-goi-von-series-a-thanh-cong-tu-quy-dau-tu-my.html', 'div.content-single article', 0, '2019-10-02 08:55:27', '2019-10-02 08:55:27'),
(18, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/nghe-thuat-ban-hang-qua-facebook-tac-gia-kim-thuy-nspw1iomrqkmv5z9jlaxg8uk028dwbc8z4k8geflxs.png', 'Cảnh giác với cuốn sách Nghệ thuật bán hàng qua Facebook', 'canh-giac-voi-cuon-sach-nghe-thuat-ban-hang-qua-facebook', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/canh-giac-voi-cuon-sach-nghe-thuat-ban-hang-qua-facebook.html', 'div.content-single article', 0, '2019-10-02 08:55:27', '2019-10-02 08:55:27'),
(19, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/sai-lam-khi-khoi-nghiep-nocoaezv7go9w3tnvk1kmmkbhfhdb2l4ssvlv082j4.png', 'Những suy nghĩ sai lầm khi khởi nghiệp', 'nhung-suy-nghi-sai-lam-khi-khoi-nghiep', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/nhung-suy-nghi-sai-lam-khi-khoi-nghiep.html', 'div.content-single article', 0, '2019-10-02 08:55:27', '2019-10-02 08:55:27'),
(20, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/tu-van-khoi-nghiep-noax68qsjw8mu2a6rwarsi2gn8qjiv7qql4bsj75jk.jpg', 'Dịch vụ tư vấn khởi nghiệp', 'dich-vu-tu-van-khoi-nghiep', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/dich-vu-tu-van-khoi-nghiep.html', 'div.content-single article', 0, '2019-10-02 08:55:27', '2019-10-02 08:55:27'),
(21, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/5-nguyen-tac-tim-tu-van-khoi-nghiep-no9awghrusj3rlfkd4971vc9dkg8t35kzil215ls5s.png', '5 nguyên tắc tìm tư vấn khởi nghiệp', '5-nguyen-tac-tim-tu-van-khoi-nghiep', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/5-nguyen-tac-tim-tu-van-khoi-nghiep.html', 'div.content-single article', 0, '2019-10-02 08:55:27', '2019-10-02 08:55:27'),
(22, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/canh-giac-voi-tu-van-khoi-nghiep-2-no9ahjrxge4dm936f69804s26jxnpwyulq2t05pkuo.png', 'Cảnh giác với các công ty tư vấn khởi nghiệp', 'canh-giac-voi-cac-cong-ty-tu-van-khoi-nghiep', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/canh-giac-voi-cac-cong-ty-tu-van-khoi-nghiep.html', 'div.content-single article', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(23, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/kinh-nghiem-tim-chuyen-gia-tu-van-khoi-nghiep-no99zvf6xjx9a8rin16sm3d00p25ytski8f33tx3v4.png', 'Kinh nghiệm tìm chuyên gia tư vấn khởi nghiệp', 'kinh-nghiem-tim-chuyen-gia-tu-van-khoi-nghiep', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/kinh-nghiem-tim-chuyen-gia-tu-van-khoi-nghiep.html', 'div.content-single article', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(24, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/tu-van-khoi-nghiep-la-gi-no99oqzy24p3wcx5l83q3wemyjvsvrmwz6i8nyeths.png', 'Tư vấn khởi nghiệp là gì?', 'tu-van-khoi-nghiep-la-gi', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/tu-van-khoi-nghiep-la-gi.html', 'div.content-single article', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(25, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/lo-trinh-startup-no6iyxt0stsqj112ckjqi6wt8u5xsq94pg73t9oki8.png', 'Quy trình 9 giai đoạn của 1 startup cơ bản', 'quy-trinh-9-giai-doan-cua-1-startup-co-ban', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/quy-trinh-9-giai-doan-cua-1-startup-co-ban.html', 'div.content-single article', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(26, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/thuong-hieu-dia-phuong-1-768x521-no623cwn622dwzko6xv7sigm0kuoc078i7eacejqhc.jpg', 'Khởi nghiệp với các mô hình mang tính địa phương', 'khoi-nghiep-voi-cac-mo-hinh-mang-tinh-dia-phuong', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/khoi-nghiep-voi-cac-mo-hinh-mang-tinh-dia-phuong.html', 'div.content-single article', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(27, 'http://khoinghiepvietnam.org/wp-content/uploads/bfi_thumb/bao-cao-chi-so-thuong-mai-dien-tu-viet-nam-nnfpd6owznku36eykm0sw76b6mf6iki42qv6vva3f4.png', 'Báo cáo Chỉ số Thương mại điện tử Việt Nam 2018', 'bao-cao-chi-so-thuong-mai-dien-tu-viet-nam-2018', 'http://khoinghiepvietnam.org/tin-tuc-su-kien/tin-tuc/bao-cao-chi-so-thuong-mai-dien-tu-viet-nam-2018.html', 'div.content-single article', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(28, 'https://www.brandsvietnam.com/upload/news/200px/2019/19265_11.jpg', 'Bách Hóa Xanh Bình Phước: Doanh thu 1 ngày bằng siêu thị khác bán cả tháng', '19265-Bach-Hoa-Xanh-Binh-Phuoc-Doanh-thu-1-ngay-bang-sieu-thi-khac-ban-ca-thang', 'https://www.brandsvietnam.com/19265-Bach-Hoa-Xanh-Binh-Phuoc-Doanh-thu-1-ngay-bang-sieu-thi-khac-ban-ca-thang', ' div.reading-content', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(29, 'https://www.brandsvietnam.com/upload/news/200px/2019/image4_1569567287.jpg', 'Tại sao các thương hiệu lại chọn quảng cáo trên Cốc Cốc?', '19245-Tai-sao-cac-thuong-hieu-lai-chon-quang-cao-tren-Coc-Coc', 'https://www.brandsvietnam.com/19245-Tai-sao-cac-thuong-hieu-lai-chon-quang-cao-tren-Coc-Coc', ' div.reading-content', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(30, 'https://www.brandsvietnam.com/upload/news/200px/2019/19266_2.jpg', '[Infographics] Mở cafe nhượng quyền tốn bao nhiêu?', '19266-Infographics-Mo-cafe-nhuong-quyen-ton-bao-nhieu', 'https://www.brandsvietnam.com/19266-Infographics-Mo-cafe-nhuong-quyen-ton-bao-nhieu', ' div.reading-content', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(31, 'https://www.brandsvietnam.com/upload/news/200px/2019/19259_20.jpg', 'Bloomberg: Bamboo Airways đặt mục tiêu chiếm 30% thị phần vào 2020', '19259-Bloomberg-Bamboo-Airways-dat-muc-tieu-chiem-30-thi-phan-vao-2020', 'https://www.brandsvietnam.com/19259-Bloomberg-Bamboo-Airways-dat-muc-tieu-chiem-30-thi-phan-vao-2020', ' div.reading-content', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(32, 'https://www.brandsvietnam.com/upload/news/200px/2019/19268_2.jpg', 'Forever 21 phá sản', '19268-Forever-21-pha-san', 'https://www.brandsvietnam.com/19268-Forever-21-pha-san', ' div.reading-content', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(33, 'https://www.brandsvietnam.com/upload/news/200px/2019/19249_another.jpg', 'Thỏa sức sáng tạo với cuộc thi ý tưởng thiết kế Bộ ấn phẩm Xuân 2020 cùng SHB', '19249-Thoa-suc-sang-tao-voi-cuoc-thi-y-tuong-thiet-ke-Bo-an-pham-Xuan-2020-cung-SHB', 'https://www.brandsvietnam.com/19249-Thoa-suc-sang-tao-voi-cuoc-thi-y-tuong-thiet-ke-Bo-an-pham-Xuan-2020-cung-SHB', ' div.reading-content', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(34, 'https://www.brandsvietnam.com/upload/news/200px/2019/19243_image4.jpg', 'Điểm đặc biệt của các logo thời trang', '19243-Diem-dac-biet-cua-cac-logo-thoi-trang', 'https://www.brandsvietnam.com/19243-Diem-dac-biet-cua-cac-logo-thoi-trang', ' div.reading-content', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(35, 'https://www.brandsvietnam.com/upload/news/200px/2019/19225_10.jpg', 'Từ 7 dòng code, hai anh em xây dựng được đế chế kinh doanh trị giá 35 tỷ USD', '19225-Tu-7-dong-code-hai-anh-em-xay-dung-duoc-de-che-kinh-doanh-tri-gia-35-ty-USD', 'https://www.brandsvietnam.com/19225-Tu-7-dong-code-hai-anh-em-xay-dung-duoc-de-che-kinh-doanh-tri-gia-35-ty-USD', ' div.reading-content', 1, '2019-10-02 08:55:28', '2020-04-30 20:50:37'),
(36, 'https://www.brandsvietnam.com/upload/news/200px/2019/19222_19222.jpg', 'Xây dựng Brand Trust - Lợi thế cạnh tranh “bị bỏ quên” của doanh nghiệp', '19222-Xay-dung-Brand-Trust-Loi-the-canh-tranh-bi-bo-quen-cua-doanh-nghiep', 'https://www.brandsvietnam.com/19222-Xay-dung-Brand-Trust-Loi-the-canh-tranh-bi-bo-quen-cua-doanh-nghiep', ' div.reading-content', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(37, 'https://www.brandsvietnam.com/upload/news/200px/2019/19242_Untitleddesign.png', 'Shopee dẫn dầu, Sendo bứt tốc cuộc đua bán hàng trên di động', '19242-Shopee-dan-dau-Sendo-but-toc-cuoc-dua-ban-hang-tren-di-dong', 'https://www.brandsvietnam.com/19242-Shopee-dan-dau-Sendo-but-toc-cuoc-dua-ban-hang-tren-di-dong', ' div.reading-content', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(38, 'https://www.brandsvietnam.com/upload/news/200px/2019/19223_2.jpg', 'Apple rót tỷ USD cho Ấn Độ, Indonesia trong khi Việt Nam vẫn là \"kế hoạch\"', '19223-Apple-rot-ty-USD-cho-An-Do-Indonesia-trong-khi-Viet-Nam-van-la-ke-hoach', 'https://www.brandsvietnam.com/19223-Apple-rot-ty-USD-cho-An-Do-Indonesia-trong-khi-Viet-Nam-van-la-ke-hoach', ' div.reading-content', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(39, 'https://www.brandsvietnam.com/upload/news/200px/2019/19233_14.jpg', 'Facebook \"bắt tay\" với Ray-Ban làm kính thông minh thay thế smartphone', '19233-Facebook-bat-tay-voi-RayBan-lam-kinh-thong-minh-thay-the-smartphone', 'https://www.brandsvietnam.com/19233-Facebook-bat-tay-voi-RayBan-lam-kinh-thong-minh-thay-the-smartphone', ' div.reading-content', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(40, 'https://www.brandsvietnam.com/upload/news/200px/2019/19239_avatar.jpg', 'Thiết kế nhận diện của các thương hiệu thời trang cao cấp', '19239-Thiet-ke-nhan-dien-cua-cac-thuong-hieu-thoi-trang-cao-cap', 'https://www.brandsvietnam.com/19239-Thiet-ke-nhan-dien-cua-cac-thuong-hieu-thoi-trang-cao-cap', ' div.reading-content', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(41, 'https://www.brandsvietnam.com/upload/news/200px/2019/19228_9.jpg', 'Siêu ứng dụng giúp Grab chiếm 73% thị phần mảng gọi xe tại Việt Nam', '19228-Sieu-ung-dung-giup-Grab-chiem-73-thi-phan-mang-goi-xe-tai-Viet-Nam', 'https://www.brandsvietnam.com/19228-Sieu-ung-dung-giup-Grab-chiem-73-thi-phan-mang-goi-xe-tai-Viet-Nam', ' div.reading-content', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(42, 'https://www.brandsvietnam.com/upload/news/200px/2019/19224_2.jpg', 'Tiki đã tiêu sạch hơn 500 tỷ tiền đầu tư của VNG', '19224-Tiki-da-tieu-sach-hon-500-ty-tien-dau-tu-cua-VNG', 'https://www.brandsvietnam.com/19224-Tiki-da-tieu-sach-hon-500-ty-tien-dau-tu-cua-VNG', ' div.reading-content', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(43, 'https://www.brandsvietnam.com/upload/news/200px/2019/19216_15.png', 'AhaMove cán mốc 60.000 đơn hàng mỗi ngày, tạo thu nhập cho 20.000 tài xế', '19216-AhaMove-can-moc-60000-don-hang-moi-ngay-tao-thu-nhap-cho-20000-tai-xe', 'https://www.brandsvietnam.com/19216-AhaMove-can-moc-60000-don-hang-moi-ngay-tao-thu-nhap-cho-20000-tai-xe', ' div.reading-content', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(44, 'https://www.brandsvietnam.com/upload/news/200px/2019/19221_hinhavatar.jpg', 'Mango kỷ niệm 15 năm hoạt động tại Việt Nam', '19221-Mango-ky-niem-15-nam-hoat-dong-tai-Viet-Nam', 'https://www.brandsvietnam.com/19221-Mango-ky-niem-15-nam-hoat-dong-tai-Viet-Nam', ' div.reading-content', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(45, 'https://www.brandsvietnam.com/upload/news/200px/2019/19229_11.jpg', 'Samsung trả đũa Huawei một cách thâm thúy', '19229-Samsung-tra-dua-Huawei-mot-cach-tham-thuy', 'https://www.brandsvietnam.com/19229-Samsung-tra-dua-Huawei-mot-cach-tham-thuy', ' div.reading-content', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(46, 'https://www.brandsvietnam.com/upload/news/200px/2019/19230_3.jpg', '6 năm Facebook chật vật tìm chỗ đứng trong mảng phần cứng', '19230-6-nam-Facebook-chat-vat-tim-cho-dung-trong-mang-phan-cung', 'https://www.brandsvietnam.com/19230-6-nam-Facebook-chat-vat-tim-cho-dung-trong-mang-phan-cung', ' div.reading-content', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(47, 'https://www.brandsvietnam.com/upload/news/200px/2019/19232_31.jpg', 'Chuỗi tạp hoá của Thế Giới Di Động thu hơn 6.000 tỷ đồng', '19232-Chuoi-tap-hoa-cua-The-Gioi-Di-Dong-thu-hon-6000-ty-dong', 'https://www.brandsvietnam.com/19232-Chuoi-tap-hoa-cua-The-Gioi-Di-Dong-thu-hon-6000-ty-dong', ' div.reading-content', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(48, 'https://www.brandsvietnam.com/upload/news/200px/2019/19213_3.jpg', 'Berocca Performance Mango củng cố định vị “năng lượng” với chuỗi hoạt động tương tác tại các tòa nhà văn phòng', '19213-Berocca-Performance-Mango-cung-co-dinh-vi-nang-luong-voi-chuoi-hoat-dong-tuong-tac-tai-cac-toa-nha-van-phong', 'https://www.brandsvietnam.com/19213-Berocca-Performance-Mango-cung-co-dinh-vi-nang-luong-voi-chuoi-hoat-dong-tuong-tac-tai-cac-toa-nha-van-phong', ' div.reading-content', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(49, 'https://www.brandsvietnam.com/upload/news/200px/2019/19201_image1.jpeg', 'Với 4 tiêu chí này, Coca-Cola đã hoàn toàn chinh phục giới trẻ Việt', '19201-Voi-4-tieu-chi-nay-CocaCola-da-hoan-toan-chinh-phuc-gioi-tre-Viet', 'https://www.brandsvietnam.com/19201-Voi-4-tieu-chi-nay-CocaCola-da-hoan-toan-chinh-phuc-gioi-tre-Viet', ' div.reading-content', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(50, 'https://www.brandsvietnam.com/upload/news/200px/2019/19217_16.jpg', 'Co.op Food vượt mốc 400 cửa hàng', '19217-Coop-Food-vuot-moc-400-cua-hang', 'https://www.brandsvietnam.com/19217-Coop-Food-vuot-moc-400-cua-hang', ' div.reading-content', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(51, 'https://www.brandsvietnam.com/upload/news/200px/2019/19210_thumbnail.png', 'Vascara thay đổi nhận diện, bước đi mới cho nhãn hàng thời trang hàng đầu Việt Nam', '19210-Vascara-thay-doi-nhan-dien-buoc-di-moi-cho-nhan-hang-thoi-trang-hang-dau-Viet-Nam', 'https://www.brandsvietnam.com/19210-Vascara-thay-doi-nhan-dien-buoc-di-moi-cho-nhan-hang-thoi-trang-hang-dau-Viet-Nam', ' div.reading-content', 1, '2019-10-02 08:55:28', '2020-03-23 20:06:23'),
(52, 'https://www.brandsvietnam.com/upload/news/200px/2019/19212_19212_Ava_1.jpg', 'Hội An, vịnh Hạ Long, hoa sen Việt vào quảng cáo của Louis Vuitton', '19212-Hoi-An-vinh-Ha-Long-hoa-sen-Viet-vao-quang-cao-cua-Louis-Vuitton', 'https://www.brandsvietnam.com/19212-Hoi-An-vinh-Ha-Long-hoa-sen-Viet-vao-quang-cao-cua-Louis-Vuitton', ' div.reading-content', 0, '2019-10-02 08:55:28', '2019-10-02 08:55:28'),
(53, 'https://www.brandsvietnam.com/upload/news/200px/2019/19211_19211_Ava_1.jpg', '6 tháng thay 2 CEO, chuyện gì đang xảy ra với Go-Viet?', '19211-6-thang-thay-2-CEO-chuyen-gi-dang-xay-ra-voi-GoViet', 'https://www.brandsvietnam.com/19211-6-thang-thay-2-CEO-chuyen-gi-dang-xay-ra-voi-GoViet', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(54, 'https://www.brandsvietnam.com/upload/news/200px/2019/19206_2.jpg', 'FPT tăng trưởng 30% lợi nhuận sau thuế', '19206-FPT-tang-truong-30-loi-nhuan-sau-thue', 'https://www.brandsvietnam.com/19206-FPT-tang-truong-30-loi-nhuan-sau-thue', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(55, 'https://www.brandsvietnam.com/upload/news/200px/2019/19208_17.jpg', 'Chủ tịch PNJ Cao Thị Ngọc Dung: Tôi không phải là \'iron women\', tôi chỉ là người dám nhìn thẳng vào sự thật', '19208-Chu-tich-PNJ-Cao-Thi-Ngoc-Dung-Toi-khong-phai-la-iron-women-toi-chi-la-nguoi-dam-nhin-thang-vao-su-that', 'https://www.brandsvietnam.com/19208-Chu-tich-PNJ-Cao-Thi-Ngoc-Dung-Toi-khong-phai-la-iron-women-toi-chi-la-nguoi-dam-nhin-thang-vao-su-that', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(56, 'https://www.brandsvietnam.com/upload/news/200px/2019/19202_9.jpg', 'Bà Lê Diệp Kiều Trang rời Go-Viet', '19202-Ba-Le-Diep-Kieu-Trang-roi-GoViet', 'https://www.brandsvietnam.com/19202-Ba-Le-Diep-Kieu-Trang-roi-GoViet', ' div.reading-content', 3, '2019-10-02 08:55:29', '2020-03-03 16:34:18'),
(57, 'https://www.brandsvietnam.com/upload/news/200px/2019/19187_22.jpg', 'Facebook bắt tay Microsoft tổ chức cuộc thi phát hiện deepfake', '19187-Facebook-bat-tay-Microsoft-to-chuc-cuoc-thi-phat-hien-deepfake', 'https://www.brandsvietnam.com/19187-Facebook-bat-tay-Microsoft-to-chuc-cuoc-thi-phat-hien-deepfake', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(58, 'https://www.brandsvietnam.com/upload/news/200px/2019/19186_7.png', 'Facebook đe dọa “nồi cơm” của các ứng dụng hẹn hò', '19186-Facebook-de-doa-noi-com-cua-cac-ung-dung-hen-ho', 'https://www.brandsvietnam.com/19186-Facebook-de-doa-noi-com-cua-cac-ung-dung-hen-ho', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(59, 'https://www.brandsvietnam.com/upload/news/200px/2019/19170_1.jpg', 'MB tài trợ gói quản trị cho doanh nghiệp', '19170-MB-tai-tro-goi-quan-tri-cho-doanh-nghiep', 'https://www.brandsvietnam.com/19170-MB-tai-tro-goi-quan-tri-cho-doanh-nghiep', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(60, 'https://www.brandsvietnam.com/upload/news/200px/2019/19196_avatar_adamkhoo.jpg', 'Adam Khoo: từ một đứa trẻ dốt toán thành thần đồng toán học – bắt đầu chỉ với một niềm tin', '19196-Adam-Khoo-tu-mot-dua-tre-dot-toan-thanh-than-dong-toan-hoc-bat-dau-chi-voi-mot-niem-tin', 'https://www.brandsvietnam.com/19196-Adam-Khoo-tu-mot-dua-tre-dot-toan-thanh-than-dong-toan-hoc-bat-dau-chi-voi-mot-niem-tin', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(61, 'https://www.brandsvietnam.com/upload/news/200px/2019/19198_9.jpg', 'HSBC Việt Nam có tổng giám đốc mới', '19198-HSBC-Viet-Nam-co-tong-giam-doc-moi', 'https://www.brandsvietnam.com/19198-HSBC-Viet-Nam-co-tong-giam-doc-moi', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(62, 'https://www.brandsvietnam.com/upload/news/200px/2019/19188_7.jpg', 'Thương vụ thâu tóm 2,3 tỉ USD làm nóng thị trường Insuretech', '19188-Thuong-vu-thau-tom-23-ti-USD-lam-nong-thi-truong-Insuretech', 'https://www.brandsvietnam.com/19188-Thuong-vu-thau-tom-23-ti-USD-lam-nong-thi-truong-Insuretech', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(63, 'https://www.brandsvietnam.com/upload/news/200px/2019/19193_5.jpg', 'Nestlé đã đầu tư 100 triệu đô la vào Hưng Yên', '19193-Nestle-da-dau-tu-100-trieu-do-la-vao-Hung-Yen', 'https://www.brandsvietnam.com/19193-Nestle-da-dau-tu-100-trieu-do-la-vao-Hung-Yen', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(64, 'https://www.brandsvietnam.com/upload/news/200px/2019/19185_thunmbail.jpg', 'Jollibee Việt Nam đưa vào vận hành nhà máy mới và được chứng nhận ISO 22000:2018', '19185-Jollibee-Viet-Nam-dua-vao-van-hanh-nha-may-moi-va-duoc-chung-nhan-ISO-220002018', 'https://www.brandsvietnam.com/19185-Jollibee-Viet-Nam-dua-vao-van-hanh-nha-may-moi-va-duoc-chung-nhan-ISO-220002018', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(65, 'https://www.brandsvietnam.com/upload/news/200px/2019/19171_14.jpg', 'MoMo thêm tính năng thanh toán các dịch vụ của Apple', '19171-MoMo-them-tinh-nang-thanh-toan-cac-dich-vu-cua-Apple', 'https://www.brandsvietnam.com/19171-MoMo-them-tinh-nang-thanh-toan-cac-dich-vu-cua-Apple', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(66, 'https://www.brandsvietnam.com/upload/news/200px/2019/19172_1.jpg', 'Phó chủ tịch Bamboo Airways đầu quân cho Sunshine Group', '19172-Pho-chu-tich-Bamboo-Airways-dau-quan-cho-Sunshine-Group', 'https://www.brandsvietnam.com/19172-Pho-chu-tich-Bamboo-Airways-dau-quan-cho-Sunshine-Group', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(67, 'https://www.brandsvietnam.com/upload/news/200px/2019/19174_107.jpeg', '20 năm của Alibaba dưới thời Jack Ma', '19174-20-nam-cua-Alibaba-duoi-thoi-Jack-Ma', 'https://www.brandsvietnam.com/19174-20-nam-cua-Alibaba-duoi-thoi-Jack-Ma', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(68, 'https://www.brandsvietnam.com/upload/news/200px/2019/19173_20.jpg', 'Sanofi - Aventis Việt Nam nhập khẩu trực tiếp dược phẩm', '19173-Sanofi-Aventis-Viet-Nam-nhap-khau-truc-tiep-duoc-pham', 'https://www.brandsvietnam.com/19173-Sanofi-Aventis-Viet-Nam-nhap-khau-truc-tiep-duoc-pham', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(69, 'https://www.brandsvietnam.com/upload/news/200px/2019/19084_6.jpg', 'Cựu nhân viên khách sạn thành chủ startup dịch vụ lưu trú triệu USD', '19084-Cuu-nhan-vien-khach-san-thanh-chu-startup-dich-vu-luu-tru-trieu-USD', 'https://www.brandsvietnam.com/19084-Cuu-nhan-vien-khach-san-thanh-chu-startup-dich-vu-luu-tru-trieu-USD', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(70, 'https://www.brandsvietnam.com/upload/news/200px/2019/19155_9.jpg', 'Huyền thoại Cô Ba xà bông', '19155-Huyen-thoai-Co-Ba-xa-bong', 'https://www.brandsvietnam.com/19155-Huyen-thoai-Co-Ba-xa-bong', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(71, 'https://www.brandsvietnam.com/upload/news/200px/2019/19164_4.jpg', 'Volkswagen công bố logo mới, ứng dụng logo âm thanh đầu tiên trên thế giới', '19164-Volkswagen-cong-bo-logo-moi-ung-dung-logo-am-thanh-dau-tien-tren-the-gioi', 'https://www.brandsvietnam.com/19164-Volkswagen-cong-bo-logo-moi-ung-dung-logo-am-thanh-dau-tien-tren-the-gioi', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(72, 'https://www.brandsvietnam.com/upload/news/200px/2019/19166_avatar.jpg', 'Macaw: Nền tảng quản lý công việc và dự án với tinh thần Startup', '19166-Macaw-Nen-tang-quan-ly-cong-viec-va-du-an-voi-tinh-than-Startup', 'https://www.brandsvietnam.com/19166-Macaw-Nen-tang-quan-ly-cong-viec-va-du-an-voi-tinh-than-Startup', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(73, 'https://www.brandsvietnam.com/upload/news/200px/2019/19168_15.jpg', 'Viettel Global lãi sáu tháng gần 1.200 tỷ đồng', '19168-Viettel-Global-lai-sau-thang-gan-1200-ty-dong', 'https://www.brandsvietnam.com/19168-Viettel-Global-lai-sau-thang-gan-1200-ty-dong', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(74, 'https://www.brandsvietnam.com/upload/news/200px/2019/11_1568109665.jpg', 'CEO Nissan từ chức', '19167-CEO-Nissan-tu-chuc', 'https://www.brandsvietnam.com/19167-CEO-Nissan-tu-chuc', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(75, 'https://www.brandsvietnam.com/upload/news/200px/2019/19160_14.jpg', 'Thế giằng co của Gojek và Grab trên thị trường giao đồ ăn', '19160-The-giang-co-cua-Gojek-va-Grab-tren-thi-truong-giao-do-an', 'https://www.brandsvietnam.com/19160-The-giang-co-cua-Gojek-va-Grab-tren-thi-truong-giao-do-an', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(76, 'https://www.brandsvietnam.com/upload/news/200px/2019/19161_25.png', 'Nike chi 162 triệu euro thuê Cristiano Ronaldo quảng cáo', '19161-Nike-chi-162-trieu-euro-thue-Cristiano-Ronaldo-quang-cao', 'https://www.brandsvietnam.com/19161-Nike-chi-162-trieu-euro-thue-Cristiano-Ronaldo-quang-cao', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(77, 'https://www.brandsvietnam.com/upload/news/200px/2019/19162_Apple.jpg', 'Lễ ra mắt iPhone sẽ phát trực tiếp trên YouTube', '19162-Le-ra-mat-iPhone-se-phat-truc-tiep-tren-YouTube', 'https://www.brandsvietnam.com/19162-Le-ra-mat-iPhone-se-phat-truc-tiep-tren-YouTube', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(78, 'https://www.brandsvietnam.com/upload/news/200px/2019/19150_5.jpg', 'Samsung và Apple so kè từng chút một ở phân khúc smartphone cao cấp Việt Nam', '19150-Samsung-va-Apple-so-ke-tung-chut-mot-o-phan-khuc-smartphone-cao-cap-Viet-Nam', 'https://www.brandsvietnam.com/19150-Samsung-va-Apple-so-ke-tung-chut-mot-o-phan-khuc-smartphone-cao-cap-Viet-Nam', ' div.reading-content', 1, '2019-10-02 08:55:29', '2020-03-03 15:55:54'),
(79, 'https://www.brandsvietnam.com/upload/news/200px/2019/19157_14.png', 'Vincom Retail lý giải gì về kết quả kinh doanh đột biến?', '19157-Vincom-Retail-ly-giai-gi-ve-ket-qua-kinh-doanh-dot-bien', 'https://www.brandsvietnam.com/19157-Vincom-Retail-ly-giai-gi-ve-ket-qua-kinh-doanh-dot-bien', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(80, 'https://www.brandsvietnam.com/upload/news/200px/2019/19134_6.jpg', 'Apple trước đòn thuế mới của Trump', '19134-Apple-truoc-don-thue-moi-cua-Trump', 'https://www.brandsvietnam.com/19134-Apple-truoc-don-thue-moi-cua-Trump', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(81, 'https://www.brandsvietnam.com/upload/news/200px/2019/19159_19159_Ava_1.jpg', '\'Gia tộc dầu hào\' sở hữu 15 tỷ USD tham vọng tồn tại 1.000 năm', '19159-Gia-toc-dau-hao-so-huu-15-ty-USD-tham-vong-ton-tai-1000-nam', 'https://www.brandsvietnam.com/19159-Gia-toc-dau-hao-so-huu-15-ty-USD-tham-vong-ton-tai-1000-nam', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(82, 'https://www.brandsvietnam.com/upload/news/200px/2019/19153_7.png', 'Sovico Group - Grab hợp tác hoàn thiện mạng lưới giao nhận hàng hóa đầu cuối', '19153-Sovico-Group-Grab-hop-tac-hoan-thien-mang-luoi-giao-nhan-hang-hoa-dau-cuoi', 'https://www.brandsvietnam.com/19153-Sovico-Group-Grab-hop-tac-hoan-thien-mang-luoi-giao-nhan-hang-hoa-dau-cuoi', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(83, 'https://www.brandsvietnam.com/upload/news/200px/2019/19140_1.jpg', '7 doanh nghiệp Việt tỷ \"đô\" tốt nhất châu Á - Thái Bình Dương', '19140-7-doanh-nghiep-Viet-ty-do-tot-nhat-chau-A-Thai-Binh-Duong', 'https://www.brandsvietnam.com/19140-7-doanh-nghiep-Viet-ty-do-tot-nhat-chau-A-Thai-Binh-Duong', ' div.reading-content', 0, '2019-10-02 08:55:29', '2019-10-02 08:55:29'),
(84, 'https://www.brandsvietnam.com/upload/news/200px/2019/19135_5.jpg', 'Thế Giới Di Động mở loạt cửa hàng điện thoại giá rẻ', '19135-The-Gioi-Di-Dong-mo-loat-cua-hang-dien-thoai-gia-re', 'https://www.brandsvietnam.com/19135-The-Gioi-Di-Dong-mo-loat-cua-hang-dien-thoai-gia-re', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(85, 'https://www.brandsvietnam.com/upload/news/200px/2019/19156_100.jpg', 'Vietjet dẫn đầu thị phần hàng không nội địa 6 tháng, doanh thu quốc tế tăng 51%, doanh thu phụ trợ tăng 43%', '19156-Vietjet-dan-dau-thi-phan-hang-khong-noi-dia-6-thang-doanh-thu-quoc-te-tang-51-doanh-thu-phu-tro-tang-43', 'https://www.brandsvietnam.com/19156-Vietjet-dan-dau-thi-phan-hang-khong-noi-dia-6-thang-doanh-thu-quoc-te-tang-51-doanh-thu-phu-tro-tang-43', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(86, 'https://www.brandsvietnam.com/upload/news/200px/2019/19152_LaVielogo.png', 'Ngưng sử dụng màng co nắp chai La Vie', '19152-Ngung-su-dung-mang-co-nap-chai-La-Vie', 'https://www.brandsvietnam.com/19152-Ngung-su-dung-mang-co-nap-chai-La-Vie', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(87, 'https://www.brandsvietnam.com/upload/news/200px/2019/19136_1.jpg', 'Vinamilk lọt vào Top 200 công ty có doanh thu tỷ USD tốt nhất châu Á - Thái Bình Dương', '19136-Vinamilk-lot-vao-Top-200-cong-ty-co-doanh-thu-ty-USD-tot-nhat-chau-A-Thai-Binh-Duong', 'https://www.brandsvietnam.com/19136-Vinamilk-lot-vao-Top-200-cong-ty-co-doanh-thu-ty-USD-tot-nhat-chau-A-Thai-Binh-Duong', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(88, 'https://www.brandsvietnam.com/upload/news/200px/2019/19244_3.jpg', 'Facebook bắt đầu ẩn số lượt like bài viết', '19244-Facebook-bat-dau-an-so-luot-like-bai-viet', 'https://www.brandsvietnam.com/19244-Facebook-bat-dau-an-so-luot-like-bai-viet', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(89, 'https://www.brandsvietnam.com/upload/news/200px/2019/19240_8.jpg', 'TikTok và cuộc đua thông tin ngắn', '19240-TikTok-va-cuoc-dua-thong-tin-ngan', 'https://www.brandsvietnam.com/19240-TikTok-va-cuoc-dua-thong-tin-ngan', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(90, 'https://www.brandsvietnam.com/upload/news/200px/2019/19234_2.png', 'Vấp phải làn sóng phản đối, chương trình xác minh mới của YouTube phải hủy bỏ', '19234-Vap-phai-lan-song-phan-doi-chuong-trinh-xac-minh-moi-cua-YouTube-phai-huy-bo', 'https://www.brandsvietnam.com/19234-Vap-phai-lan-song-phan-doi-chuong-trinh-xac-minh-moi-cua-YouTube-phai-huy-bo', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(91, 'https://www.brandsvietnam.com/upload/news/200px/2019/19179_5.png', 'Facebook Việt Nam nói gì sau tin \"50 triệu điện thoại người dùng Việt bị lộ\"?', '19179-Facebook-Viet-Nam-noi-gi-sau-tin-50-trieu-dien-thoai-nguoi-dung-Viet-bi-lo', 'https://www.brandsvietnam.com/19179-Facebook-Viet-Nam-noi-gi-sau-tin-50-trieu-dien-thoai-nguoi-dung-Viet-bi-lo', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(92, 'https://www.brandsvietnam.com/upload/news/200px/2019/19126_13.jpg', 'Facebook xem xét bỏ hiển thị lượt thích', '19126-Facebook-xem-xet-bo-hien-thi-luot-thich', 'https://www.brandsvietnam.com/19126-Facebook-xem-xet-bo-hien-thi-luot-thich', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(93, 'https://www.brandsvietnam.com/upload/news/200px/2019/18993_7.png', 'PewPew thông báo rút khỏi giải trí để chuyển sang kinh doanh', '18993-PewPew-thong-bao-rut-khoi-giai-tri-de-chuyen-sang-kinh-doanh', 'https://www.brandsvietnam.com/18993-PewPew-thong-bao-rut-khoi-giai-tri-de-chuyen-sang-kinh-doanh', ' div.reading-content', 1, '2019-10-02 08:55:30', '2020-03-03 16:31:13'),
(94, 'https://www.brandsvietnam.com/upload/news/200px/2019/18943_google-records-your-voice-searches-and-you-can-hear-them-all-image-cultofandroidcomwp-contentuploads201407Ok-Google-Voice-Search-780x495.png', 'Google thay đổi quan trọng đối với ứng dụng Search', '18943-Google-thay-doi-quan-trong-doi-voi-ung-dung-Search', 'https://www.brandsvietnam.com/18943-Google-thay-doi-quan-trong-doi-voi-ung-dung-Search', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(95, 'https://www.brandsvietnam.com/upload/news/200px/2019/IMG_8798ava_1564456926.jpg', 'MediaStep Software ra mắt nền tảng tạo Web - App kinh doanh', '18944-MediaStep-Software-ra-mat-nen-tang-tao-Web-App-kinh-doanh', 'https://www.brandsvietnam.com/18944-MediaStep-Software-ra-mat-nen-tang-tao-Web-App-kinh-doanh', ' div.reading-content', 2, '2019-10-02 08:55:30', '2020-03-23 20:07:26'),
(96, 'https://www.brandsvietnam.com/upload/news/200px/2019/18917_3.jpg', 'Facebook chính thức nhận án phạt lịch sử 5 tỷ USD, chấp nhận bị giám sát chặt hơn', '18917-Facebook-chinh-thuc-nhan-an-phat-lich-su-5-ty-USD-chap-nhan-bi-giam-sat-chat-hon', 'https://www.brandsvietnam.com/18917-Facebook-chinh-thuc-nhan-an-phat-lich-su-5-ty-USD-chap-nhan-bi-giam-sat-chat-hon', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(97, 'https://www.brandsvietnam.com/upload/news/200px/2019/18923_2.jpg', 'Chân dung nữ sáng lập 26 tuổi của dự án tiền ảo Facebook', '18923-Chan-dung-nu-sang-lap-26-tuoi-cua-du-an-tien-ao-Facebook', 'https://www.brandsvietnam.com/18923-Chan-dung-nu-sang-lap-26-tuoi-cua-du-an-tien-ao-Facebook', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(98, 'https://www.brandsvietnam.com/upload/news/200px/2019/18929_facebook.jpg', 'Facebook chính thức nhận án phạt lịch sử 5 tỷ USD, chấp nhận bị giám sát chặt hơn', '18929-Facebook-chinh-thuc-nhan-an-phat-lich-su-5-ty-USD-chap-nhan-bi-giam-sat-chat-hon', 'https://www.brandsvietnam.com/18929-Facebook-chinh-thuc-nhan-an-phat-lich-su-5-ty-USD-chap-nhan-bi-giam-sat-chat-hon', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(99, 'https://www.brandsvietnam.com/upload/news/200px/2019/18906_Untitleddesign-7.png', 'GCOMM công bố mua lại mảng tư vấn doanh nghiệp của CASK Academy, tái cấu trúc với 3 bộ phận lõi: Business Solution, Business Analysis và Business Insight', '18906-GCOMM-cong-bo-mua-lai-mang-tu-van-doanh-nghiep-cua-CASK-Academy-tai-cau-truc-voi-3-bo-phan-loi-Business-Solution-Business-Analysis-va-Business-Insight', 'https://www.brandsvietnam.com/18906-GCOMM-cong-bo-mua-lai-mang-tu-van-doanh-nghiep-cua-CASK-Academy-tai-cau-truc-voi-3-bo-phan-loi-Business-Solution-Business-Analysis-va-Business-Insight', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(100, 'https://www.brandsvietnam.com/upload/news/200px/2019/18900_18900_Ava.png', 'Hội nghị Mindshare Huddle: chặng tiếp sức của Truyền thông kỹ thuật số', '18900-Hoi-nghi-Mindshare-Huddle-chang-tiep-suc-cua-Truyen-thong-ky-thuat-so', 'https://www.brandsvietnam.com/18900-Hoi-nghi-Mindshare-Huddle-chang-tiep-suc-cua-Truyen-thong-ky-thuat-so', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(101, 'https://www.brandsvietnam.com/upload/news/200px/2019/18873_hiip-brvn-thumb.jpg', 'CEO Việt gọi vốn triệu USD \'tấn công\' thị trường KOL Thái Lan, Indonesia', '18873-CEO-Viet-goi-von-trieu-USD-tan-cong-thi-truong-KOL-Thai-Lan-Indonesia', 'https://www.brandsvietnam.com/18873-CEO-Viet-goi-von-trieu-USD-tan-cong-thi-truong-KOL-Thai-Lan-Indonesia', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(102, 'https://www.brandsvietnam.com/upload/news/200px/2019/18839_18839_Ava11.png', 'Mindshare Việt Nam ra mắt Hội nghị truyền thông Mindshare Huddle', '18839-Mindshare-Viet-Nam-ra-mat-Hoi-nghi-truyen-thong-Mindshare-Huddle', 'https://www.brandsvietnam.com/18839-Mindshare-Viet-Nam-ra-mat-Hoi-nghi-truyen-thong-Mindshare-Huddle', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(103, 'https://www.brandsvietnam.com/upload/news/200px/2019/18824_TikTok.jpg', 'TikTok kết nối nhà sáng tạo và nhãn hàng tại Đông Nam Á', '18824-TikTok-ket-noi-nha-sang-tao-va-nhan-hang-tai-Dong-Nam-A', 'https://www.brandsvietnam.com/18824-TikTok-ket-noi-nha-sang-tao-va-nhan-hang-tai-Dong-Nam-A', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(104, 'https://www.brandsvietnam.com/upload/news/200px/2019/18817_elle-viet-nam-instagram-01.jpg', 'Instagram sẽ cho phép ẩn comment tiêu cực', '18817-Instagram-se-cho-phep-an-comment-tieu-cuc', 'https://www.brandsvietnam.com/18817-Instagram-se-cho-phep-an-comment-tieu-cuc', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(105, 'https://www.brandsvietnam.com/upload/news/200px/2019/18818_100000.png', 'Instagram tham vọng trở thành ứng dụng mua hàng', '18818-Instagram-tham-vong-tro-thanh-ung-dung-mua-hang', 'https://www.brandsvietnam.com/18818-Instagram-tham-vong-tro-thanh-ung-dung-mua-hang', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(106, 'https://www.brandsvietnam.com/upload/news/200px/2019/18806_nielsen.png', 'Sẵn sàng cho thời đại đổi mới với giải pháp chiến lược Nielsen BASES ra mắt tại Việt Nam', '18806-San-sang-cho-thoi-dai-doi-moi-voi-giai-phap-chien-luoc-Nielsen-BASES-ra-mat-tai-Viet-Nam', 'https://www.brandsvietnam.com/18806-San-sang-cho-thoi-dai-doi-moi-voi-giai-phap-chien-luoc-Nielsen-BASES-ra-mat-tai-Viet-Nam', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(107, 'https://www.brandsvietnam.com/upload/news/200px/2019/18753_Heniken2.png', 'Công ty cung cấp \'chân dài\' làm ăn thế nào khi Heineken cắt hợp đồng?', '18753-Cong-ty-cung-cap-chan-dai-lam-an-the-nao-khi-Heineken-cat-hop-dong', 'https://www.brandsvietnam.com/18753-Cong-ty-cung-cap-chan-dai-lam-an-the-nao-khi-Heineken-cat-hop-dong', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(108, 'https://www.brandsvietnam.com/upload/news/200px/2019/genz-gender-norms-CONTENT-2019_1561533521.jpg', 'Gen Z đang dần thay đổi các chuẩn mực giới tính', '18701-Gen-Z-dang-dan-thay-doi-cac-chuan-muc-gioi-tinh', 'https://www.brandsvietnam.com/18701-Gen-Z-dang-dan-thay-doi-cac-chuan-muc-gioi-tinh', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(109, 'https://www.brandsvietnam.com/upload/news/200px/2019/18724_Instagram.jpg', 'Quảng cáo trên thẻ Instagram Explore là \'mỏ vàng\' của Facebook', '18724-Quang-cao-tren-the-Instagram-Explore-la-mo-vang-cua-Facebook', 'https://www.brandsvietnam.com/18724-Quang-cao-tren-the-Instagram-Explore-la-mo-vang-cua-Facebook', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(110, 'https://www.brandsvietnam.com/upload/news/200px/2019/18729_YouTube.jpg', 'Những điều chỉnh về tính năng mới của YouTube bạn nên biết', '18729-Nhung-dieu-chinh-ve-tinh-nang-moi-cua-YouTube-ban-nen-biet', 'https://www.brandsvietnam.com/18729-Nhung-dieu-chinh-ve-tinh-nang-moi-cua-YouTube-ban-nen-biet', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(111, 'https://www.brandsvietnam.com/upload/news/200px/2019/18710_Facebook.jpg', 'Facebook ra mắt công cụ minh bạch quảng cáo trên toàn cầu', '18710-Facebook-ra-mat-cong-cu-minh-bach-quang-cao-tren-toan-cau', 'https://www.brandsvietnam.com/18710-Facebook-ra-mat-cong-cu-minh-bach-quang-cao-tren-toan-cau', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(112, 'https://www.brandsvietnam.com/upload/news/200px/2019/18682_GenZ.jpg', 'Nhiều xu hướng sáng tạo của Gen Z được Snapchat công bố tại Cannes', '18682-Nhieu-xu-huong-sang-tao-cua-Gen-Z-duoc-Snapchat-cong-bo-tai-Cannes', 'https://www.brandsvietnam.com/18682-Nhieu-xu-huong-sang-tao-cua-Gen-Z-duoc-Snapchat-cong-bo-tai-Cannes', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(113, 'https://www.brandsvietnam.com/upload/news/200px/2019/18678_TikTok.jpg', 'TikTok tuyên bố có 1 tỷ người dùng hoạt động tích cực hàng tháng', '18678-TikTok-tuyen-bo-co-1-ty-nguoi-dung-hoat-dong-tich-cuc-hang-thang', 'https://www.brandsvietnam.com/18678-TikTok-tuyen-bo-co-1-ty-nguoi-dung-hoat-dong-tich-cuc-hang-thang', ' div.reading-content', 0, '2019-10-02 08:55:30', '2019-10-02 08:55:30'),
(114, 'https://www.brandsvietnam.com/upload/news/200px/2019/18670_YouTube.jpg', 'YouTube ẩn phần bình luận video', '18670-YouTube-an-phan-binh-luan-video', 'https://www.brandsvietnam.com/18670-YouTube-an-phan-binh-luan-video', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31'),
(115, 'https://www.brandsvietnam.com/upload/news/200px/2019/18652_GamesOfThrones.jpg', 'Những ứng cử viên ưu tú cho giải Titanium tại Cannes Lion 2019', '18652-Nhung-ung-cu-vien-uu-tu-cho-giai-Titanium-tai-Cannes-Lion-2019', 'https://www.brandsvietnam.com/18652-Nhung-ung-cu-vien-uu-tu-cho-giai-Titanium-tai-Cannes-Lion-2019', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31'),
(116, 'https://www.brandsvietnam.com/upload/news/200px/2019/18626_DEAF911.jpg', '5 chiến dịch của Mỹ dự đoán đạt giải The Innovation Lions tại Cannes 2019', '18626-5-chien-dich-cua-My-du-doan-dat-giai-The-Innovation-Lions-tai-Cannes-2019', 'https://www.brandsvietnam.com/18626-5-chien-dich-cua-My-du-doan-dat-giai-The-Innovation-Lions-tai-Cannes-2019', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31'),
(117, 'https://www.brandsvietnam.com/upload/news/200px/2019/18640_Chrome.png', 'Chrome chặn Quảng cáo: Thách thức mới cho Publisher, Nhà quảng cáo và Thương hiệu', '18640-Chrome-chan-Quang-cao-Thach-thuc-moi-cho-Publisher-Nha-quang-cao-va-Thuong-hieu', 'https://www.brandsvietnam.com/18640-Chrome-chan-Quang-cao-Thach-thuc-moi-cho-Publisher-Nha-quang-cao-va-Thuong-hieu', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31'),
(118, 'https://www.brandsvietnam.com/upload/news/200px/2019/18639_SundarPichai.jpg', 'CEO Google: YouTube quá lớn, không thể sửa lỗi hoàn toàn', '18639-CEO-Google-YouTube-qua-lon-khong-the-sua-loi-hoan-toan', 'https://www.brandsvietnam.com/18639-CEO-Google-YouTube-qua-lon-khong-the-sua-loi-hoan-toan', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31'),
(119, 'https://www.brandsvietnam.com/upload/news/200px/2019/18629_TikTok.jpg', 'Sau thu hút người dùng, TikTok âm thầm tìm cách tăng doanh thu', '18629-Sau-thu-hut-nguoi-dung-TikTok-am-tham-tim-cach-tang-doanh-thu', 'https://www.brandsvietnam.com/18629-Sau-thu-hut-nguoi-dung-TikTok-am-tham-tim-cach-tang-doanh-thu', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31'),
(120, 'https://www.brandsvietnam.com/upload/news/200px/2019/18612_BreMiller.jpg', 'Facebook: \'Người dùng Việt Nam thích xem livestream về game\'', '18612-Facebook-Nguoi-dung-Viet-Nam-thich-xem-livestream-ve-game', 'https://www.brandsvietnam.com/18612-Facebook-Nguoi-dung-Viet-Nam-thich-xem-livestream-ve-game', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31'),
(121, 'https://www.brandsvietnam.com/upload/news/200px/2019/18621_DigitalAgency.jpg', 'Điểm danh các Digital Marketing Agency nổi bật ở Việt Nam', '18621-Diem-danh-cac-Digital-Marketing-Agency-noi-bat-o-Viet-Nam', 'https://www.brandsvietnam.com/18621-Diem-danh-cac-Digital-Marketing-Agency-noi-bat-o-Viet-Nam', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31'),
(122, 'https://www.brandsvietnam.com/upload/news/200px/2019/18613_Facebook.jpg', 'Facebook tiến hành xếp hạng comment, ngăn chặn bình luận nhảm, vô văn hóa', '18613-Facebook-tien-hanh-xep-hang-comment-ngan-chan-binh-luan-nham-vo-van-hoa', 'https://www.brandsvietnam.com/18613-Facebook-tien-hanh-xep-hang-comment-ngan-chan-binh-luan-nham-vo-van-hoa', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31'),
(123, 'https://www.brandsvietnam.com/upload/news/200px/2019/18594_FacebookWatch.png', 'Facebook Watch tăng trưởng mạnh mẽ sau một năm ra mắt', '18594-Facebook-Watch-tang-truong-manh-me-sau-mot-nam-ra-mat', 'https://www.brandsvietnam.com/18594-Facebook-Watch-tang-truong-manh-me-sau-mot-nam-ra-mat', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31'),
(124, 'https://www.brandsvietnam.com/upload/news/200px/2019/18587_PR_1.png', 'Danh sách thắng giải PR Awards Asia 2019: Dentsu Redder đạt 2 giải Bạc', '18587-Danh-sach-thang-giai-PR-Awards-Asia-2019-Dentsu-Redder-dat-2-giai-Bac', 'https://www.brandsvietnam.com/18587-Danh-sach-thang-giai-PR-Awards-Asia-2019-Dentsu-Redder-dat-2-giai-Bac', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31'),
(125, 'https://www.brandsvietnam.com/upload/news/200px/2019/18561_InstagramStory.png', 'Instagram thêm tính năng chèn lời bài hát trong Stories', '18561-Instagram-them-tinh-nang-chen-loi-bai-hat-trong-Stories', 'https://www.brandsvietnam.com/18561-Instagram-them-tinh-nang-chen-loi-bai-hat-trong-Stories', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31'),
(126, 'https://www.brandsvietnam.com/upload/news/200px/2019/18532_Facebook.jpg', 'Facebook khóa hàng loạt fanpage tại Việt Nam', '18532-Facebook-khoa-hang-loat-fanpage-tai-Viet-Nam', 'https://www.brandsvietnam.com/18532-Facebook-khoa-hang-loat-fanpage-tai-Viet-Nam', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31');
INSERT INTO `news` (`id`, `image`, `title`, `slug`, `content`, `post_by`, `view`, `created_at`, `updated_at`) VALUES
(127, 'https://www.brandsvietnam.com/upload/news/200px/2019/18483_FacebookPortal.jpg', 'Facebook Portal có ứng dụng Android riêng để quản lý ảnh và video', '18483-Facebook-Portal-co-ung-dung-Android-rieng-de-quan-ly-anh-va-video', 'https://www.brandsvietnam.com/18483-Facebook-Portal-co-ung-dung-Android-rieng-de-quan-ly-anh-va-video', ' div.reading-content', 1, '2019-10-02 08:55:31', '2020-03-03 16:35:53'),
(128, 'https://www.brandsvietnam.com/upload/news/200px/2019/18490_Tech.jpg', 'Công nghệ xoay chuyển ngành truyền thông tiếp thị như thế nào?', '18490-Cong-nghe-xoay-chuyen-nganh-truyen-thong-tiep-thi-nhu-the-nao', 'https://www.brandsvietnam.com/18490-Cong-nghe-xoay-chuyen-nganh-truyen-thong-tiep-thi-nhu-the-nao', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31'),
(129, 'https://www.brandsvietnam.com/upload/news/200px/2019/18433_WhatsApp.jpg', 'WhatsApp cho di động sẽ hiển thị quảng cáo', '18433-WhatsApp-cho-di-dong-se-hien-thi-quang-cao', 'https://www.brandsvietnam.com/18433-WhatsApp-cho-di-dong-se-hien-thi-quang-cao', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31'),
(130, 'https://www.brandsvietnam.com/upload/news/200px/2019/18435_Instagram.jpg', 'Instagram IGTV chính thức hỗ trợ thêm video ngang', '18435-Instagram-IGTV-chinh-thuc-ho-tro-them-video-ngang', 'https://www.brandsvietnam.com/18435-Instagram-IGTV-chinh-thuc-ho-tro-them-video-ngang', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31'),
(131, 'https://www.brandsvietnam.com/upload/news/200px/2019/18434_Google.jpg', 'Google Search thêm tên trang web và logo vào trang kết quả tìm kiếm', '18434-Google-Search-them-ten-trang-web-va-logo-vao-trang-ket-qua-tim-kiem', 'https://www.brandsvietnam.com/18434-Google-Search-them-ten-trang-web-va-logo-vao-trang-ket-qua-tim-kiem', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31'),
(132, 'https://www.brandsvietnam.com/upload/news/200px/2019/18428_Facebook.jpg', 'Facebook tuyên bố xóa 2,2 tỷ tài khoản giả mạo trong quý đầu năm 2019', '18428-Facebook-tuyen-bo-xoa-22-ty-tai-khoan-gia-mao-trong-quy-dau-nam-2019', 'https://www.brandsvietnam.com/18428-Facebook-tuyen-bo-xoa-22-ty-tai-khoan-gia-mao-trong-quy-dau-nam-2019', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31'),
(133, 'https://www.brandsvietnam.com/upload/news/200px/2019/18394_GroupM.jpg', 'GroupM bổ nhiệm CEO mới tại Việt Nam', '18394-GroupM-bo-nhiem-CEO-moi-tai-Viet-Nam', 'https://www.brandsvietnam.com/18394-GroupM-bo-nhiem-CEO-moi-tai-Viet-Nam', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31'),
(134, 'https://www.brandsvietnam.com/upload/news/200px/2019/18377_Facebook.jpg', 'Facebook chính thức ra mắt tính năng hẹn hò (Facebook Dating) tại Việt Nam', '18377-Facebook-chinh-thuc-ra-mat-tinh-nang-hen-ho-Facebook-Dating-tai-Viet-Nam', 'https://www.brandsvietnam.com/18377-Facebook-chinh-thuc-ra-mat-tinh-nang-hen-ho-Facebook-Dating-tai-Viet-Nam', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31'),
(135, 'https://www.brandsvietnam.com/upload/news/200px/2019/18389_Facebook.jpg', '5 công bố lớn nhất của Facebook tại Hội nghị nhà phát triển F8', '18389-5-cong-bo-lon-nhat-cua-Facebook-tai-Hoi-nghi-nha-phat-trien-F8', 'https://www.brandsvietnam.com/18389-5-cong-bo-lon-nhat-cua-Facebook-tai-Hoi-nghi-nha-phat-trien-F8', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31'),
(136, 'https://www.brandsvietnam.com/upload/news/200px/2019/18376_Facebook.jpg', 'Facebook công bố giao diện hoàn toàn mới', '18376-Facebook-cong-bo-giao-dien-hoan-toan-moi', 'https://www.brandsvietnam.com/18376-Facebook-cong-bo-giao-dien-hoan-toan-moi', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31'),
(137, 'https://www.brandsvietnam.com/upload/news/200px/2019/18366_Google.jpg', 'Quảng cáo trực tuyến không còn ‘đẻ trứng vàng’ cho Google?', '18366-Quang-cao-truc-tuyen-khong-con-de-trung-vang-cho-Google', 'https://www.brandsvietnam.com/18366-Quang-cao-truc-tuyen-khong-con-de-trung-vang-cho-Google', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31'),
(138, 'https://www.brandsvietnam.com/upload/news/200px/2019/18355_Facebook.jpeg', 'Ứng dụng đoán tính cách sẽ không còn \'đất sống\' trên Facebook', '18355-Ung-dung-doan-tinh-cach-se-khong-con-dat-song-tren-Facebook', 'https://www.brandsvietnam.com/18355-Ung-dung-doan-tinh-cach-se-khong-con-dat-song-tren-Facebook', ' div.reading-content', 0, '2019-10-02 08:55:31', '2019-10-02 08:55:31'),
(139, 'https://www.brandsvietnam.com/upload/news/200px/2019/18457_18441_Teaser_avatar01.jpg', 'Câu chuyện đằng sau “3 giây hút khách” của Founder Teaser.vn hay chàng kỹ sư yêu Marketing', '18457-Cau-chuyen-dang-sau-3-giay-hut-khach-cua-Founder-Teaservn-hay-chang-ky-su-yeu-Marketing', 'https://www.brandsvietnam.com/18457-Cau-chuyen-dang-sau-3-giay-hut-khach-cua-Founder-Teaservn-hay-chang-ky-su-yeu-Marketing', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(140, 'https://www.brandsvietnam.com/upload/news/200px/2019/18343_Hiip.png', 'Hiip mua lại BP Network ở Indonesia', '18343-Hiip-mua-lai-BP-Network-o-Indonesia', 'https://www.brandsvietnam.com/18343-Hiip-mua-lai-BP-Network-o-Indonesia', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(141, 'https://www.brandsvietnam.com/upload/news/200px/2019/18334_Facebook.jpg', 'Facebook kiếm hơn 6,4 USD từ mỗi người dùng', '18334-Facebook-kiem-hon-64-USD-tu-moi-nguoi-dung', 'https://www.brandsvietnam.com/18334-Facebook-kiem-hon-64-USD-tu-moi-nguoi-dung', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(142, 'https://www.brandsvietnam.com/upload/news/200px/2019/18338_YouTube.jpg', 'Việt Nam là một trong 5 thị trường lớn nhất của YouTube', '18338-Viet-Nam-la-mot-trong-5-thi-truong-lon-nhat-cua-YouTube', 'https://www.brandsvietnam.com/18338-Viet-Nam-la-mot-trong-5-thi-truong-lon-nhat-cua-YouTube', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(143, 'https://www.brandsvietnam.com/upload/news/200px/2019/18326_Twitter.jpg', 'Twitter tăng vọt 16% sau báo cáo kết quả kinh doanh vượt kỳ vọng', '18326-Twitter-tang-vot-16-sau-bao-cao-ket-qua-kinh-doanh-vuot-ky-vong', 'https://www.brandsvietnam.com/18326-Twitter-tang-vot-16-sau-bao-cao-ket-qua-kinh-doanh-vuot-ky-vong', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(144, 'https://www.brandsvietnam.com/upload/news/200px/2019/18331_18331-10.png', 'TikTok chính thức ra mắt tại Việt Nam và công bố chiến lược đa dạng hóa nội dung', '18331-TikTok-chinh-thuc-ra-mat-tai-Viet-Nam-va-cong-bo-chien-luoc-da-dang-hoa-noi-dung', 'https://www.brandsvietnam.com/18331-TikTok-chinh-thuc-ra-mat-tai-Viet-Nam-va-cong-bo-chien-luoc-da-dang-hoa-noi-dung', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(145, 'https://www.brandsvietnam.com/upload/news/200px/2019/18318_18318_Minet_Avatar.png', 'SocialFeed Marketing sẽ thay thế Influencer trong tương lai như thế nào?', '18318-SocialFeed-Marketing-se-thay-the-Influencer-trong-tuong-lai-nhu-the-nao', 'https://www.brandsvietnam.com/18318-SocialFeed-Marketing-se-thay-the-Influencer-trong-tuong-lai-nhu-the-nao', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(146, 'https://www.brandsvietnam.com/upload/news/200px/2019/18310_YouNet.jpg', 'R&D team YouNet Group: “AI và Machine Learning phát hiện 98% hồ sơ Influencers Việt Nam không đạt chuẩn của SociaLift”', '18310-RD-team-YouNet-Group-AI-va-Machine-Learning-phat-hien-98-ho-so-Influencers-Viet-Nam-khong-dat-chuan-cua-SociaLift', 'https://www.brandsvietnam.com/18310-RD-team-YouNet-Group-AI-va-Machine-Learning-phat-hien-98-ho-so-Influencers-Viet-Nam-khong-dat-chuan-cua-SociaLift', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(147, 'https://www.brandsvietnam.com/upload/news/200px/2019/18307_Pinterest.jpg', 'Pinterest lên sàn, là IPO \'hot\' thứ nhì năm nay', '18307-Pinterest-len-san-la-IPO-hot-thu-nhi-nam-nay', 'https://www.brandsvietnam.com/18307-Pinterest-len-san-la-IPO-hot-thu-nhi-nam-nay', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(148, 'https://www.brandsvietnam.com/upload/news/200px/2019/19241_5.jpg', 'Burger King và cuộc chuyển đổi hoành tráng', '19241-Burger-King-va-cuoc-chuyen-doi-hoanh-trang', 'https://www.brandsvietnam.com/19241-Burger-King-va-cuoc-chuyen-doi-hoanh-trang', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(149, 'https://www.brandsvietnam.com/upload/news/200px/2019/18992_viettel.jpg', 'Quyền chủ tịch Viettel: Chuyển đổi số phải quyết tâm kiểu \'nếu không làm thì sẽ chết\'!', '18992-Quyen-chu-tich-Viettel-Chuyen-doi-so-phai-quyet-tam-kieu-neu-khong-lam-thi-se-chet', 'https://www.brandsvietnam.com/18992-Quyen-chu-tich-Viettel-Chuyen-doi-so-phai-quyet-tam-kieu-neu-khong-lam-thi-se-chet', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(150, 'https://www.brandsvietnam.com/upload/news/200px/2019/18913_1.jpg', 'Tư duy lãnh đạo: Thông minh hơn A.I - Chạy đua cùng robot', '18913-Tu-duy-lanh-dao-Thong-minh-hon-AI-Chay-dua-cung-robot', 'https://www.brandsvietnam.com/18913-Tu-duy-lanh-dao-Thong-minh-hon-AI-Chay-dua-cung-robot', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(151, 'https://www.brandsvietnam.com/upload/news/200px/2019/18936_Starbuck.jpg', '“Bậc thầy” tâm lý học Starbucks và 4 “cạm bẫy” chực chờ trên menu', '18936-Bac-thay-tam-ly-hoc-Starbucks-va-4-cam-bay-chuc-cho-tren-menu', 'https://www.brandsvietnam.com/18936-Bac-thay-tam-ly-hoc-Starbucks-va-4-cam-bay-chuc-cho-tren-menu', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(152, 'https://www.brandsvietnam.com/upload/news/200px/2019/18852_17.jpg', 'Đường đến 10 tỉ USD của Thế Giới Di Động', '18852-Duong-den-10-ti-USD-cua-The-Gioi-Di-Dong', 'https://www.brandsvietnam.com/18852-Duong-den-10-ti-USD-cua-The-Gioi-Di-Dong', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(153, 'https://www.brandsvietnam.com/upload/news/200px/2019/18855_emotion-marketing.png', 'Người tiêu dùng không mua sản phẩm, họ mua cả sự hoàn hảo được khơi gợi từ cảm xúc', '18855-Nguoi-tieu-dung-khong-mua-san-pham-ho-mua-ca-su-hoan-hao-duoc-khoi-goi-tu-cam-xuc', 'https://www.brandsvietnam.com/18855-Nguoi-tieu-dung-khong-mua-san-pham-ho-mua-ca-su-hoan-hao-duoc-khoi-goi-tu-cam-xuc', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(154, 'https://www.brandsvietnam.com/upload/news/200px/2019/18854_sang-tao.jpg', 'Hãy giúp người dùng cùng sáng tạo sản phẩm, họ sẽ quảng bá nó miễn phí', '18854-Hay-giup-nguoi-dung-cung-sang-tao-san-pham-ho-se-quang-ba-no-mien-phi', 'https://www.brandsvietnam.com/18854-Hay-giup-nguoi-dung-cung-sang-tao-san-pham-ho-se-quang-ba-no-mien-phi', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(155, 'https://www.brandsvietnam.com/upload/news/200px/2019/18861_Gan-nhu-khong-quang-cao-Zara-thu-hut-khach-hang-nhu-the-nao.jpg', 'Những điều làm nên sự thành công của Zara', '18861-Nhung-dieu-lam-nen-su-thanh-cong-cua-Zara', 'https://www.brandsvietnam.com/18861-Nhung-dieu-lam-nen-su-thanh-cong-cua-Zara', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(156, 'https://www.brandsvietnam.com/upload/news/200px/2019/18798_rawImage.jpg', '6 chiến thuật đơn giản giúp Eric Yuan xây dựng Zoom thành doanh nghiệp 20 tỷ USD', '18798-6-chien-thuat-don-gian-giup-Eric-Yuan-xay-dung-Zoom-thanh-doanh-nghiep-20-ty-USD', 'https://www.brandsvietnam.com/18798-6-chien-thuat-don-gian-giup-Eric-Yuan-xay-dung-Zoom-thanh-doanh-nghiep-20-ty-USD', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(157, 'https://www.brandsvietnam.com/upload/news/200px/2019/18719_Thumb-4.png', 'Re-think CSR #1 - Ông Khuất Quang Hưng @ Nestlé  Vietnam: “Đầu tư dài hạn để phát triển bền vững”', 'tieudiem', 'https://www.brandsvietnam.com/tieudiem/18719-Rethink-CSR-1-Ong-Khuat-Quang-Hung-Nestle-Vietnam-Dau-tu-dai-han-de-phat-trien-ben-vung', ' div.reading-content', 1, '2019-10-02 08:55:32', '2020-03-03 16:05:42'),
(158, 'https://www.brandsvietnam.com/upload/news/200px/2019/18742_Walls.jpg', 'Wall’s trở thành hãng kem phổ biến nhất thế giới như thế nào?', '18742-Walls-tro-thanh-hang-kem-pho-bien-nhat-the-gioi-nhu-the-nao', 'https://www.brandsvietnam.com/18742-Walls-tro-thanh-hang-kem-pho-bien-nhat-the-gioi-nhu-the-nao', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(159, 'https://www.brandsvietnam.com/upload/news/200px/2019/18676_ToysRUs.jpg', 'Chuỗi đồ chơi Toys \'R\' Us của Mỹ \'hồi sinh từ cái chết\'', '18676-Chuoi-do-choi-Toys-R-Us-cua-My-hoi-sinh-tu-cai-chet', 'https://www.brandsvietnam.com/18676-Chuoi-do-choi-Toys-R-Us-cua-My-hoi-sinh-tu-cai-chet', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(160, 'https://www.brandsvietnam.com/upload/news/200px/2019/Vinamilk_1_1560737587.jpg', 'Hero - Hub - Help: Ba chiến lược nội dung giúp Vinamilk thành công trên kênh digital', '18619-Hero-Hub-Help-Ba-chien-luoc-noi-dung-giup-Vinamilk-thanh-cong-tren-kenh-digital', 'https://www.brandsvietnam.com/18619-Hero-Hub-Help-Ba-chien-luoc-noi-dung-giup-Vinamilk-thanh-cong-tren-kenh-digital', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(161, 'https://www.brandsvietnam.com/upload/news/200px/2019/18623_lon_coke.jpg', 'Phiên bản lon “Việt Nam tôi yêu, Coca-Cola tôi yêu” tương tác khách hàng cả Online & Offline', '18623-Phien-ban-lon-Viet-Nam-toi-yeu-CocaCola-toi-yeu-tuong-tac-khach-hang-ca-Online-Offline', 'https://www.brandsvietnam.com/18623-Phien-ban-lon-Viet-Nam-toi-yeu-CocaCola-toi-yeu-tuong-tac-khach-hang-ca-Online-Offline', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(162, 'https://www.brandsvietnam.com/upload/news/200px/2019/18572_Listerine.jpeg', 'Thừa nhận điểm yếu: Độc chiêu tiếp thị dễ chiếm cảm tình của khách hàng', '18572-Thua-nhan-diem-yeu-Doc-chieu-tiep-thi-de-chiem-cam-tinh-cua-khach-hang', 'https://www.brandsvietnam.com/18572-Thua-nhan-diem-yeu-Doc-chieu-tiep-thi-de-chiem-cam-tinh-cua-khach-hang', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(163, 'https://www.brandsvietnam.com/upload/news/200px/2019/18564_CocaColaPepsi.png', 'Muốn sống sót, thương hiệu mới phải tìm ra thuộc tính trái ngược với kẻ dẫn đầu', '18564-Muon-song-sot-thuong-hieu-moi-phai-tim-ra-thuoc-tinh-trai-nguoc-voi-ke-dan-dau', 'https://www.brandsvietnam.com/18564-Muon-song-sot-thuong-hieu-moi-phai-tim-ra-thuoc-tinh-trai-nguoc-voi-ke-dan-dau', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(164, 'https://www.brandsvietnam.com/upload/news/200px/2019/18565_Nike.jpg', 'Nói về bất công để tăng độ gắn bó của khách hàng: Nghệ thuật xây dựng thương hiệu của Nike', '18565-Noi-ve-bat-cong-de-tang-do-gan-bo-cua-khach-hang-Nghe-thuat-xay-dung-thuong-hieu-cua-Nike', 'https://www.brandsvietnam.com/18565-Noi-ve-bat-cong-de-tang-do-gan-bo-cua-khach-hang-Nghe-thuat-xay-dung-thuong-hieu-cua-Nike', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(165, 'https://www.brandsvietnam.com/upload/news/200px/2019/18491_Digital.jpg', 'Để tiếp thị kỹ thuật số đến gần với khách hàng hơn', '18491-De-tiep-thi-ky-thuat-so-den-gan-voi-khach-hang-hon', 'https://www.brandsvietnam.com/18491-De-tiep-thi-ky-thuat-so-den-gan-voi-khach-hang-hon', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(166, 'https://www.brandsvietnam.com/upload/news/200px/2019/18383_Zara.jpg', 'Gần như không quảng cáo, Zara thu hút khách hàng như thế nào?', '18383-Gan-nhu-khong-quang-cao-Zara-thu-hut-khach-hang-nhu-the-nao', 'https://www.brandsvietnam.com/18383-Gan-nhu-khong-quang-cao-Zara-thu-hut-khach-hang-nhu-the-nao', ' div.reading-content', 0, '2019-10-02 08:55:32', '2019-10-02 08:55:32'),
(167, 'https://www.brandsvietnam.com/upload/news/200px/2019/18381_eCommerce.jpg', 'Những bài học thành công trong thương mại điện tử', '18381-Nhung-bai-hoc-thanh-cong-trong-thuong-mai-dien-tu', 'https://www.brandsvietnam.com/18381-Nhung-bai-hoc-thanh-cong-trong-thuong-mai-dien-tu', ' div.reading-content', 1, '2019-10-02 08:55:32', '2020-03-03 16:31:06'),
(168, 'https://www.brandsvietnam.com/upload/news/200px/2019/18356_FB.png', 'Thương hiệu ẩm thực: Thành công bắt đầu từ chiếc điện thoại di động', '18356-Thuong-hieu-am-thuc-Thanh-cong-bat-dau-tu-chiec-dien-thoai-di-dong', 'https://www.brandsvietnam.com/18356-Thuong-hieu-am-thuc-Thanh-cong-bat-dau-tu-chiec-dien-thoai-di-dong', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(169, 'https://www.brandsvietnam.com/upload/news/200px/2019/18315_Ollies.jpg', 'Đế chế bán lẻ 5 tỉ USD Ollie’s nói không với bán hàng trực tuyến', '18315-De-che-ban-le-5-ti-USD-Ollies-noi-khong-voi-ban-hang-truc-tuyen', 'https://www.brandsvietnam.com/18315-De-che-ban-le-5-ti-USD-Ollies-noi-khong-voi-ban-hang-truc-tuyen', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(170, 'https://www.brandsvietnam.com/upload/news/200px/2019/18240_DJKoh.jpg', 'Chuyện chiếc quần jeans và chiến lược mới của Samsung', '18240-Chuyen-chiec-quan-jeans-va-chien-luoc-moi-cua-Samsung', 'https://www.brandsvietnam.com/18240-Chuyen-chiec-quan-jeans-va-chien-luoc-moi-cua-Samsung', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(171, 'https://www.brandsvietnam.com/upload/news/200px/2019/18215_Mickey.jpg', 'Disney đã xây dựng thương hiệu Chuột Mickey cho người lớn như thế nào? (Phần 2)', '18215-Disney-da-xay-dung-thuong-hieu-Chuot-Mickey-cho-nguoi-lon-nhu-the-nao-Phan-2', 'https://www.brandsvietnam.com/18215-Disney-da-xay-dung-thuong-hieu-Chuot-Mickey-cho-nguoi-lon-nhu-the-nao-Phan-2', ' div.reading-content', 2, '2019-10-02 08:55:33', '2020-03-03 16:09:56'),
(172, 'https://www.brandsvietnam.com/upload/news/200px/2019/18214_InfluencerMarketing.png', 'Tiếp thị thông qua người ảnh hưởng: Nên xem họ như những sứ giả nhãn hiệu', '18214-Tiep-thi-thong-qua-nguoi-anh-huong-Nen-xem-ho-nhu-nhung-su-gia-nhan-hieu', 'https://www.brandsvietnam.com/18214-Tiep-thi-thong-qua-nguoi-anh-huong-Nen-xem-ho-nhu-nhung-su-gia-nhan-hieu', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(173, 'https://www.brandsvietnam.com/upload/news/200px/2019/18216_Mickey.jpg', 'Disney đã xây dựng thương hiệu Chuột Mickey cho người lớn như thế nào? (Phần 1)', '18216-Disney-da-xay-dung-thuong-hieu-Chuot-Mickey-cho-nguoi-lon-nhu-the-nao-Phan-1', 'https://www.brandsvietnam.com/18216-Disney-da-xay-dung-thuong-hieu-Chuot-Mickey-cho-nguoi-lon-nhu-the-nao-Phan-1', ' div.reading-content', 1, '2019-10-02 08:55:33', '2020-03-23 20:07:31'),
(174, 'https://www.brandsvietnam.com/upload/news/200px/2019/18130_DanielWellington.png', 'Chiến lược marketing của đồng hồ Daniel Wellington', '18130-Chien-luoc-marketing-cua-dong-ho-Daniel-Wellington', 'https://www.brandsvietnam.com/18130-Chien-luoc-marketing-cua-dong-ho-Daniel-Wellington', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(175, 'https://www.brandsvietnam.com/upload/news/200px/2019/18118_Smartphone.jpg', 'Chiến lược hai nhãn hiệu đang giúp smartphone Trung Quốc cạnh tranh thế nào?', '18118-Chien-luoc-hai-nhan-hieu-dang-giup-smartphone-Trung-Quoc-canh-tranh-the-nao', 'https://www.brandsvietnam.com/18118-Chien-luoc-hai-nhan-hieu-dang-giup-smartphone-Trung-Quoc-canh-tranh-the-nao', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(176, 'https://www.brandsvietnam.com/upload/news/200px/2019/18107_Creative.jpg', 'Sáng tạo để tìm chiến lược mới', '18107-Sang-tao-de-tim-chien-luoc-moi', 'https://www.brandsvietnam.com/18107-Sang-tao-de-tim-chien-luoc-moi', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(177, 'https://www.brandsvietnam.com/upload/news/200px/2019/18069_CSR.jpg', 'Những điều cần biết trong xây dựng chiến lược CSR 4.0', '18069-Nhung-dieu-can-biet-trong-xay-dung-chien-luoc-CSR-40', 'https://www.brandsvietnam.com/18069-Nhung-dieu-can-biet-trong-xay-dung-chien-luoc-CSR-40', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(178, 'https://www.brandsvietnam.com/upload/news/200px/2019/18065_Data.jpg', '6 bước xây dựng chiến lược dữ liệu', '18065-6-buoc-xay-dung-chien-luoc-du-lieu', 'https://www.brandsvietnam.com/18065-6-buoc-xay-dung-chien-luoc-du-lieu', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(179, 'https://www.brandsvietnam.com/upload/news/200px/2019/18011_Manager.jpg', '4 chiến thuật của một nhà lãnh đạo hiệu quả', '18011-4-chien-thuat-cua-mot-nha-lanh-dao-hieu-qua', 'https://www.brandsvietnam.com/18011-4-chien-thuat-cua-mot-nha-lanh-dao-hieu-qua', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(180, 'https://www.brandsvietnam.com/upload/news/200px/2019/17997_7Eleven.jpg', 'Bài học thành công từ 7-Eleven ở Đài Loan', '17997-Bai-hoc-thanh-cong-tu-7Eleven-o-Dai-Loan', 'https://www.brandsvietnam.com/17997-Bai-hoc-thanh-cong-tu-7Eleven-o-Dai-Loan', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(181, 'https://www.brandsvietnam.com/upload/news/200px/2019/17945_RedBull.jpg', 'Nghệ thuật Marketing của Redbull', '17945-Nghe-thuat-Marketing-cua-Redbull', 'https://www.brandsvietnam.com/17945-Nghe-thuat-Marketing-cua-Redbull', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(182, 'https://www.brandsvietnam.com/upload/news/200px/2019/17873_Branding.jpg', '5 xu hướng xây dựng thương hiệu đáng chú ý', '17873-5-xu-huong-xay-dung-thuong-hieu-dang-chu-y', 'https://www.brandsvietnam.com/17873-5-xu-huong-xay-dung-thuong-hieu-dang-chu-y', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(183, 'https://www.brandsvietnam.com/upload/news/200px/2019/17872_HomeDepot.jpg', 'Cải thiện trải nghiệm của khách hàng trong ngành bán lẻ: Bài học từ Home Depot', '17872-Cai-thien-trai-nghiem-cua-khach-hang-trong-nganh-ban-le-Bai-hoc-tu-Home-Depot', 'https://www.brandsvietnam.com/17872-Cai-thien-trai-nghiem-cua-khach-hang-trong-nganh-ban-le-Bai-hoc-tu-Home-Depot', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(184, 'https://www.brandsvietnam.com/upload/news/200px/2019/17771_Amazon.jpg', '\"Kiềng 3 chân\" quyết định sự sống còn của Amazon', '17771-Kieng-3-chan-quyet-dinh-su-song-con-cua-Amazon', 'https://www.brandsvietnam.com/17771-Kieng-3-chan-quyet-dinh-su-song-con-cua-Amazon', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(185, 'https://www.brandsvietnam.com/upload/news/200px/2019/17773_Lush.jpg', 'Lush - chuỗi cửa hàng xà bông tăng trưởng bất chấp \"ác mộng\" bán lẻ', '17773-Lush-chuoi-cua-hang-xa-bong-tang-truong-bat-chap-ac-mong-ban-le', 'https://www.brandsvietnam.com/17773-Lush-chuoi-cua-hang-xa-bong-tang-truong-bat-chap-ac-mong-ban-le', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(186, 'https://www.brandsvietnam.com/upload/news/200px/2019/17745_Thuonghieu.jpg', '3 cách để thương hiệu luôn đáp ứng được kỳ vọng của khách hàng', '17745-3-cach-de-thuong-hieu-luon-dap-ung-duoc-ky-vong-cua-khach-hang', 'https://www.brandsvietnam.com/17745-3-cach-de-thuong-hieu-luon-dap-ung-duoc-ky-vong-cua-khach-hang', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(187, 'https://www.brandsvietnam.com/upload/news/200px/2019/17759_PNJ.jpg', 'Bước nhảy tiếp theo của PNJ', '17759-Buoc-nhay-tiep-theo-cua-PNJ', 'https://www.brandsvietnam.com/17759-Buoc-nhay-tiep-theo-cua-PNJ', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(188, 'https://www.brandsvietnam.com/upload/news/200px/2019/17756_Levis.jpeg', 'Tự biến mình thành startup, doanh thu 2017 của Levi’s lập kỷ lục sau gần 2 thập kỷ', '17756-Tu-bien-minh-thanh-startup-doanh-thu-2017-cua-Levis-lap-ky-luc-sau-gan-2-thap-ky', 'https://www.brandsvietnam.com/17756-Tu-bien-minh-thanh-startup-doanh-thu-2017-cua-Levis-lap-ky-luc-sau-gan-2-thap-ky', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(189, 'https://www.brandsvietnam.com/upload/news/200px/2019/17753_Millennials.jpg', 'Làm thế nào để thế hệ Millennials tin vào quảng cáo?', '17753-Lam-the-nao-de-the-he-Millennials-tin-vao-quang-cao', 'https://www.brandsvietnam.com/17753-Lam-the-nao-de-the-he-Millennials-tin-vao-quang-cao', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(190, 'https://www.brandsvietnam.com/upload/news/200px/2019/17615_Gillette.JPG', 'Công ty hàng tiêu dùng nhắm khách hàng mua định kỳ', '17615-Cong-ty-hang-tieu-dung-nham-khach-hang-mua-dinh-ky', 'https://www.brandsvietnam.com/17615-Cong-ty-hang-tieu-dung-nham-khach-hang-mua-dinh-ky', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(191, 'https://www.brandsvietnam.com/upload/news/200px/2019/17536_SethGodin.jpg', '3 cách đơn giản cho chiến lược marketing năm 2019', '17536-3-cach-don-gian-cho-chien-luoc-marketing-nam-2019', 'https://www.brandsvietnam.com/17536-3-cach-don-gian-cho-chien-luoc-marketing-nam-2019', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(192, 'https://www.brandsvietnam.com/upload/news/200px/2019/17463_Microsoft.jpg', 'Khi Microsoft mở rộng cửa công nghệ và phần mềm', '17463-Khi-Microsoft-mo-rong-cua-cong-nghe-va-phan-mem', 'https://www.brandsvietnam.com/17463-Khi-Microsoft-mo-rong-cua-cong-nghe-va-phan-mem', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(193, 'https://www.brandsvietnam.com/upload/news/200px/2019/17493_Netflix.jpg', '“Thủ đoạn” của Netflix', '17493-Thu-doan-cua-Netflix', 'https://www.brandsvietnam.com/17493-Thu-doan-cua-Netflix', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(194, 'https://www.brandsvietnam.com/upload/news/200px/2019/17475_DigiEcosystem.jpeg', 'Chuỗi giá trị, Hệ sinh thái và các quy luật mới về Chiến lược Kinh doanh (Phần 1)', 'tieudiem', 'https://www.brandsvietnam.com/tieudiem/17475-Chuoi-gia-tri-He-sinh-thai-va-cac-quy-luat-moi-ve-Chien-luoc-Kinh-doanh-Phan-1', ' div.reading-content', 1, '2019-10-02 08:55:33', '2020-03-03 16:05:42'),
(195, 'https://www.brandsvietnam.com/upload/news/200px/2019/17477_Hotmail.png', 'Sự tăng trưởng thần kỳ của Hotmail sau 18 tháng ra mắt', '17477-Su-tang-truong-than-ky-cua-Hotmail-sau-18-thang-ra-mat', 'https://www.brandsvietnam.com/17477-Su-tang-truong-than-ky-cua-Hotmail-sau-18-thang-ra-mat', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(196, 'https://www.brandsvietnam.com/upload/news/200px/2018/17339_Casper.jpg', 'Cách Casper lật đổ thị trường nệm truyền thống', '17339-Cach-Casper-lat-do-thi-truong-nem-truyen-thong', 'https://www.brandsvietnam.com/17339-Cach-Casper-lat-do-thi-truong-nem-truyen-thong', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(197, 'https://www.brandsvietnam.com/upload/news/200px/2018/17268_FMCG.jpg', 'Ngành hàng nào, chiến lược ấy', '17268-Nganh-hang-nao-chien-luoc-ay', 'https://www.brandsvietnam.com/17268-Nganh-hang-nao-chien-luoc-ay', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(198, 'https://www.brandsvietnam.com/upload/news/200px/2018/17216_T-Mobile.png', 'T-Mobile: Làm mới “đường dây nóng” để làm hài lòng khách hàng và giữ chân nhân viên', '17216-TMobile-Lam-moi-duong-day-nong-de-lam-hai-long-khach-hang-va-giu-chan-nhan-vien', 'https://www.brandsvietnam.com/17216-TMobile-Lam-moi-duong-day-nong-de-lam-hai-long-khach-hang-va-giu-chan-nhan-vien', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(199, 'https://www.brandsvietnam.com/upload/news/200px/2018/17200_Whatsapp.jpg', 'Whatsapp: Công cụ để Facebook khai phá thị trường mới nổi', '17200-Whatsapp-Cong-cu-de-Facebook-khai-pha-thi-truong-moi-noi', 'https://www.brandsvietnam.com/17200-Whatsapp-Cong-cu-de-Facebook-khai-pha-thi-truong-moi-noi', ' div.reading-content', 0, '2019-10-02 08:55:33', '2019-10-02 08:55:33'),
(200, 'https://www.brandsvietnam.com/upload/news/200px/2018/17190_VinMec.jpg', 'Mảnh ghép dược phẩm tỉ đô của Vingroup', '17190-Manh-ghep-duoc-pham-ti-do-cua-Vingroup', 'https://www.brandsvietnam.com/17190-Manh-ghep-duoc-pham-ti-do-cua-Vingroup', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(201, 'https://www.brandsvietnam.com/upload/news/200px/2018/17169_Branding.png', 'Phát triển tính cách thương hiệu như thế nào?', '17169-Phat-trien-tinh-cach-thuong-hieu-nhu-the-nao', 'https://www.brandsvietnam.com/17169-Phat-trien-tinh-cach-thuong-hieu-nhu-the-nao', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(202, 'https://www.brandsvietnam.com/upload/news/200px/2018/17144_DigitalMarketing.jpg', 'Tăng cường hiệu quả marketing sử dụng website và mạng xã hội', '17144-Tang-cuong-hieu-qua-marketing-su-dung-website-va-mang-xa-hoi', 'https://www.brandsvietnam.com/17144-Tang-cuong-hieu-qua-marketing-su-dung-website-va-mang-xa-hoi', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(203, 'https://www.brandsvietnam.com/upload/news/200px/2018/17133_Oto.jpg', 'Chiến lược dài hơi nào cho ngành công nghiệp ô tô Việt Nam?', '17133-Chien-luoc-dai-hoi-nao-cho-nganh-cong-nghiep-o-to-Viet-Nam', 'https://www.brandsvietnam.com/17133-Chien-luoc-dai-hoi-nao-cho-nganh-cong-nghiep-o-to-Viet-Nam', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(204, 'https://www.brandsvietnam.com/upload/news/200px/2018/17113_Febreze.jpg', 'Xâm nhập tiềm thức, P&G thay đổi thói quen người dùng với Febreze', '17113-Xam-nhap-tiem-thuc-PG-thay-doi-thoi-quen-nguoi-dung-voi-Febreze', 'https://www.brandsvietnam.com/17113-Xam-nhap-tiem-thuc-PG-thay-doi-thoi-quen-nguoi-dung-voi-Febreze', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(205, 'https://www.brandsvietnam.com/upload/news/200px/2018/17048_Banle.jpg', 'Thị trường bán lẻ: Khi trải nghiệm khách hàng vượt qua ranh giới cửa hàng thực tế', '17048-Thi-truong-ban-le-Khi-trai-nghiem-khach-hang-vuot-qua-ranh-gioi-cua-hang-thuc-te', 'https://www.brandsvietnam.com/17048-Thi-truong-ban-le-Khi-trai-nghiem-khach-hang-vuot-qua-ranh-gioi-cua-hang-thuc-te', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(206, 'https://www.brandsvietnam.com/upload/news/200px/2018/17115_CyberMonday.png', 'Cyber Monday tận dụng dữ liệu lớn như thế nào?', '17115-Cyber-Monday-tan-dung-du-lieu-lon-nhu-the-nao', 'https://www.brandsvietnam.com/17115-Cyber-Monday-tan-dung-du-lieu-lon-nhu-the-nao', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(207, 'https://www.brandsvietnam.com/upload/news/200px/2018/16940_Bukalapak.jpg', 'Cách bán hàng online cho người không có Internet ở Indonesia', '16940-Cach-ban-hang-online-cho-nguoi-khong-co-Internet-o-Indonesia', 'https://www.brandsvietnam.com/16940-Cach-ban-hang-online-cho-nguoi-khong-co-Internet-o-Indonesia', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(208, 'https://www.brandsvietnam.com/upload/news/200px/2019/19016_maxresdefault_mevj.jpg', 'Microsoft “đá đểu” Apple trong quảng cáo Surface Laptop 2 mới nhất', '19016-Microsoft-da-deu-Apple-trong-quang-cao-Surface-Laptop-2-moi-nhat', 'https://www.brandsvietnam.com/19016-Microsoft-da-deu-Apple-trong-quang-cao-Surface-Laptop-2-moi-nhat', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(209, 'https://www.brandsvietnam.com/upload/news/200px/2019/18751_YouTubeWorksLogo2.jpg', 'YouTube Works Awards - Điểm hẹn của những chiến dịch Tết xuất sắc nhất 2019', '18751-YouTube-Works-Awards-Diem-hen-cua-nhung-chien-dich-Tet-xuat-sac-nhat-2019', 'https://www.brandsvietnam.com/18751-YouTube-Works-Awards-Diem-hen-cua-nhung-chien-dich-Tet-xuat-sac-nhat-2019', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(210, 'https://www.brandsvietnam.com/upload/news/200px/2019/avt_1561695351.jpg', 'Chiến dịch phản đối đánh thuế băng vệ sinh giành giải Grand Prix', '18720-Chien-dich-phan-doi-danh-thue-bang-ve-sinh-gianh-giai-Grand-Prix', 'https://www.brandsvietnam.com/18720-Chien-dich-phan-doi-danh-thue-bang-ve-sinh-gianh-giai-Grand-Prix', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(211, 'https://www.brandsvietnam.com/upload/news/200px/2019/18698_Camxuc.jpg', 'Tại sao cảm xúc lại quan trọng trong thiết kế và cách khai thác', '18698-Tai-sao-cam-xuc-lai-quan-trong-trong-thiet-ke-va-cach-khai-thac', 'https://www.brandsvietnam.com/18698-Tai-sao-cam-xuc-lai-quan-trong-trong-thiet-ke-va-cach-khai-thac', ' div.reading-content', 3, '2019-10-02 08:55:34', '2020-03-03 15:45:55'),
(212, 'https://www.brandsvietnam.com/upload/news/200px/2019/18655_Nestle.jpg', 'Quả ngọt từ nỗ lực bền bỉ thấu hiểu người dùng Việt của Nestlé', '18655-Qua-ngot-tu-no-luc-ben-bi-thau-hieu-nguoi-dung-Viet-cua-Nestle', 'https://www.brandsvietnam.com/18655-Qua-ngot-tu-no-luc-ben-bi-thau-hieu-nguoi-dung-Viet-cua-Nestle', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(213, 'https://www.brandsvietnam.com/upload/news/200px/2019/18620_5.jpg', '7 chiến dịch phản đối định kiến giới tính của Mỹ dự báo sẽ đạt giải Glass Lion', '18620-7-chien-dich-phan-doi-dinh-kien-gioi-tinh-cua-My-du-bao-se-dat-giai-Glass-Lion', 'https://www.brandsvietnam.com/18620-7-chien-dich-phan-doi-dinh-kien-gioi-tinh-cua-My-du-bao-se-dat-giai-Glass-Lion', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(214, 'https://www.brandsvietnam.com/upload/news/200px/2019/1_1_1560800487.jpg', 'Bảng xếp hạng YouTube Ads Leaderboard tại Cannes 2019: “Quang Hải – Thắp lửa những giấc mơ” đứng thứ 4', '18634-Bang-xep-hang-YouTube-Ads-Leaderboard-tai-Cannes-2019-Quang-Hai-Thap-lua-nhung-giac-mo-dung-thu-4', 'https://www.brandsvietnam.com/18634-Bang-xep-hang-YouTube-Ads-Leaderboard-tai-Cannes-2019-Quang-Hai-Thap-lua-nhung-giac-mo-dung-thu-4', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(215, 'https://www.brandsvietnam.com/upload/news/200px/2019/18617_Redbull.jpg', 'Nghệ thuật quảng bá thương hiệu qua sự kiện thể thao của Red Bull', '18617-Nghe-thuat-quang-ba-thuong-hieu-qua-su-kien-the-thao-cua-Red-Bull', 'https://www.brandsvietnam.com/18617-Nghe-thuat-quang-ba-thuong-hieu-qua-su-kien-the-thao-cua-Red-Bull', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(216, 'https://www.brandsvietnam.com/upload/news/200px/2019/18607_AvengersEndgame.jpg', 'Chiến dịch marketing khủng của Avengers: Endgame và các thương hiệu liên kết', '18607-Chien-dich-marketing-khung-cua-Avengers-Endgame-va-cac-thuong-hieu-lien-ket', 'https://www.brandsvietnam.com/18607-Chien-dich-marketing-khung-cua-Avengers-Endgame-va-cac-thuong-hieu-lien-ket', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(217, 'https://www.brandsvietnam.com/upload/news/200px/2019/18580_IKEA.jpg', 'IKEA đã tăng 50% lượt truy cập các sản phẩm của mình như thế nào?', '18580-IKEA-da-tang-50-luot-truy-cap-cac-san-pham-cua-minh-nhu-the-nao', 'https://www.brandsvietnam.com/18580-IKEA-da-tang-50-luot-truy-cap-cac-san-pham-cua-minh-nhu-the-nao', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(218, 'https://www.brandsvietnam.com/upload/news/200px/2019/18529_Huda.jpeg', 'The Brief #7: Huda Central\'s Top Talent - Làm mới nhãn hiệu di sản bằng platform âm nhạc', 'tieudiem', 'https://www.brandsvietnam.com/tieudiem/18529-The-Brief-7-Huda-Centrals-Top-Talent-Lam-moi-nhan-hieu-di-san-bang-platform-am-nhac', ' div.reading-content', 1, '2019-10-02 08:55:34', '2020-03-03 16:05:42'),
(219, 'https://www.brandsvietnam.com/upload/news/200px/2019/18517_Pepsi.jpg', 'Pepsi “chơi lớn” trên Instagram cho chiến dịch hè', '18517-Pepsi-choi-lon-tren-Instagram-cho-chien-dich-he', 'https://www.brandsvietnam.com/18517-Pepsi-choi-lon-tren-Instagram-cho-chien-dich-he', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(220, 'https://www.brandsvietnam.com/upload/news/200px/2019/18497_IKEA.jpg', 'IKEA biến phòng khách trong các phim nổi tiếng thành quảng cáo một cách sáng tạo', '18497-IKEA-bien-phong-khach-trong-cac-phim-noi-tieng-thanh-quang-cao-mot-cach-sang-tao', 'https://www.brandsvietnam.com/18497-IKEA-bien-phong-khach-trong-cac-phim-noi-tieng-thanh-quang-cao-mot-cach-sang-tao', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(221, 'https://www.brandsvietnam.com/upload/news/200px/2019/18444_BurgerKing.jpg', '7 lần châm chọc McDonald’s, 7 lần Burger King tăng mạnh doanh thu', '18444-7-lan-cham-choc-McDonalds-7-lan-Burger-King-tang-manh-doanh-thu', 'https://www.brandsvietnam.com/18444-7-lan-cham-choc-McDonalds-7-lan-Burger-King-tang-manh-doanh-thu', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(222, 'https://www.brandsvietnam.com/upload/news/200px/2019/18449_Pepsi.jpg', 'Happiness Saigon cùng Pepsi dùng rác thay lời muốn nói', '18449-Happiness-Saigon-cung-Pepsi-dung-rac-thay-loi-muon-noi', 'https://www.brandsvietnam.com/18449-Happiness-Saigon-cung-Pepsi-dung-rac-thay-loi-muon-noi', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(223, 'https://www.brandsvietnam.com/upload/news/200px/2019/18421_OldSpice.jpg', 'Bán lăn khử mùi nam cho… nữ giới, Old Spice lội ngược dòng ngoạn mục', '18421-Ban-lan-khu-mui-nam-cho-nu-gioi-Old-Spice-loi-nguoc-dong-ngoan-muc', 'https://www.brandsvietnam.com/18421-Ban-lan-khu-mui-nam-cho-nu-gioi-Old-Spice-loi-nguoc-dong-ngoan-muc', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(224, 'https://www.brandsvietnam.com/upload/news/200px/2019/18429_Logos.jpg', 'Những logo kỳ quặc nhất thế giới', '18429-Nhung-logo-ky-quac-nhat-the-gioi', 'https://www.brandsvietnam.com/18429-Nhung-logo-ky-quac-nhat-the-gioi', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(225, 'https://www.brandsvietnam.com/upload/news/200px/2019/18388_PlasticSalt.png', 'Tác hại của hạt vi nhựa - thông điệp ấn tượng từ Dentsu Singapore', '18388-Tac-hai-cua-hat-vi-nhua-thong-diep-an-tuong-tu-Dentsu-Singapore', 'https://www.brandsvietnam.com/18388-Tac-hai-cua-hat-vi-nhua-thong-diep-an-tuong-tu-Dentsu-Singapore', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(226, 'https://www.brandsvietnam.com/upload/news/200px/2019/18308_Samsung.jpeg', 'Samsung đặt những trạm sạc không dây tại các bến xe bus ở khu vực trung tâm Singapore', '18308-Samsung-dat-nhung-tram-sac-khong-day-tai-cac-ben-xe-bus-o-khu-vuc-trung-tam-Singapore', 'https://www.brandsvietnam.com/18308-Samsung-dat-nhung-tram-sac-khong-day-tai-cac-ben-xe-bus-o-khu-vuc-trung-tam-Singapore', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(227, 'https://www.brandsvietnam.com/upload/news/200px/2019/18165_Creative.jpg', '9 chiến thuật “hâm nóng” lửa sáng tạo cho đội ngũ tiếp thị', '18165-9-chien-thuat-ham-nong-lua-sang-tao-cho-doi-ngu-tiep-thi', 'https://www.brandsvietnam.com/18165-9-chien-thuat-ham-nong-lua-sang-tao-cho-doi-ngu-tiep-thi', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(228, 'https://www.brandsvietnam.com/upload/news/200px/2019/18132_Durex.jpg', 'Các nhãn hàng mượn Cá tháng Tư để chơi khăm khách hàng như thế nào?', '18132-Cac-nhan-hang-muon-Ca-thang-Tu-de-choi-kham-khach-hang-nhu-the-nao', 'https://www.brandsvietnam.com/18132-Cac-nhan-hang-muon-Ca-thang-Tu-de-choi-kham-khach-hang-nhu-the-nao', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(229, 'https://www.brandsvietnam.com/upload/news/200px/2019/18092_18092_Viettel_Avatar.png', 'Viettel thấu hiểu giới trẻ qua chiến dịch “Gia đình hay sự nghiệp quan trọng hơn?”', '18092-Viettel-thau-hieu-gioi-tre-qua-chien-dich-Gia-dinh-hay-su-nghiep-quan-trong-hon', 'https://www.brandsvietnam.com/18092-Viettel-thau-hieu-gioi-tre-qua-chien-dich-Gia-dinh-hay-su-nghiep-quan-trong-hon', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(230, 'https://www.brandsvietnam.com/upload/news/200px/2019/18048_LaCaja.jpg', 'Billboard quảng cáo thắp sáng những đoạn đường nguy hiểm của La Caja', '18048-Billboard-quang-cao-thap-sang-nhung-doan-duong-nguy-hiem-cua-La-Caja', 'https://www.brandsvietnam.com/18048-Billboard-quang-cao-thap-sang-nhung-doan-duong-nguy-hiem-cua-La-Caja', ' div.reading-content', 0, '2019-10-02 08:55:34', '2019-10-02 08:55:34'),
(231, 'https://www.brandsvietnam.com/upload/news/200px/2019/18037_Ogilvy.png', '3 chiến dịch gây tiếng vang lớn của Ogilvy Việt Nam về quảng cáo hiện đại', '18037-3-chien-dich-gay-tieng-vang-lon-cua-Ogilvy-Viet-Nam-ve-quang-cao-hien-dai', 'https://www.brandsvietnam.com/18037-3-chien-dich-gay-tieng-vang-lon-cua-Ogilvy-Viet-Nam-ve-quang-cao-hien-dai', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(232, 'https://www.brandsvietnam.com/upload/news/200px/2019/18012_18012_Ogilvy_Avatar.png', 'Giám đốc Sáng tạo Ogilvy: \"Người làm sáng tạo vẫn cần xem trọng tư duy kinh doanh\"', '18012-Giam-doc-Sang-tao-Ogilvy-Nguoi-lam-sang-tao-van-can-xem-trong-tu-duy-kinh-doanh', 'https://www.brandsvietnam.com/18012-Giam-doc-Sang-tao-Ogilvy-Nguoi-lam-sang-tao-van-can-xem-trong-tu-duy-kinh-doanh', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(233, 'https://www.brandsvietnam.com/upload/news/200px/2019/17993_17993_Ogilvy_Avatar.png', 'Ogilvy chính thức khởi động Tuần Lễ Ogilvy Việt Nam 2019 với sự ra mắt của Content Studio', '17993-Ogilvy-chinh-thuc-khoi-dong-Tuan-Le-Ogilvy-Viet-Nam-2019-voi-su-ra-mat-cua-Content-Studio', 'https://www.brandsvietnam.com/17993-Ogilvy-chinh-thuc-khoi-dong-Tuan-Le-Ogilvy-Viet-Nam-2019-voi-su-ra-mat-cua-Content-Studio', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(234, 'https://www.brandsvietnam.com/upload/news/200px/2019/17918_BalanceforBetter.jpg', 'Cách giúp các thương hiệu thoát khỏi định kiến giới tính vào ngày 8/3?', '17918-Cach-giup-cac-thuong-hieu-thoat-khoi-dinh-kien-gioi-tinh-vao-ngay-83', 'https://www.brandsvietnam.com/17918-Cach-giup-cac-thuong-hieu-thoat-khoi-dinh-kien-gioi-tinh-vao-ngay-83', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(235, 'https://www.brandsvietnam.com/upload/news/200px/2019/17913_Bitis_Ava.jpg', 'Biti’s x H’Hen Niê: Tham vọng chinh phục phân khúc giày nữ cùng câu chuyện ý nghĩa, sâu sắc và táo bạo về nữ quyền', '17913-Bitis-x-HHen-Nie-Tham-vong-chinh-phuc-phan-khuc-giay-nu-cung-cau-chuyen-y-nghia-sau-sac-va-tao-bao-ve-nu-quyen', 'https://www.brandsvietnam.com/17913-Bitis-x-HHen-Nie-Tham-vong-chinh-phuc-phan-khuc-giay-nu-cung-cau-chuyen-y-nghia-sau-sac-va-tao-bao-ve-nu-quyen', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(236, 'https://www.brandsvietnam.com/upload/news/200px/2019/17847_Abbott_480X360.png', 'Tạo “Chiến dịch Tết” cho thương hiệu sữa trẻ em - Bài toán khó hay dễ?', '17847-Tao-Chien-dich-Tet-cho-thuong-hieu-sua-tre-em-Bai-toan-kho-hay-de', 'https://www.brandsvietnam.com/17847-Tao-Chien-dich-Tet-cho-thuong-hieu-sua-tre-em-Bai-toan-kho-hay-de', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(237, 'https://www.brandsvietnam.com/upload/news/200px/2019/17861_CocaCola.jpg', 'Nằm trong top những chiến dịch hot nhất bên lề Hội nghị thượng đỉnh Mỹ - Triều, Coca-Cola đã làm gì?', '17861-Nam-trong-top-nhung-chien-dich-hot-nhat-ben-le-Hoi-nghi-thuong-dinh-My-Trieu-CocaCola-da-lam-gi', 'https://www.brandsvietnam.com/17861-Nam-trong-top-nhung-chien-dich-hot-nhat-ben-le-Hoi-nghi-thuong-dinh-My-Trieu-CocaCola-da-lam-gi', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(238, 'https://www.brandsvietnam.com/upload/news/200px/2019/17836_BiaSaigon.jpg', 'Các thương hiệu quảng cáo như thế nào nhân hội nghị Trump - Kim tại Việt Nam?', '17836-Cac-thuong-hieu-quang-cao-nhu-the-nao-nhan-hoi-nghi-Trump-Kim-tai-Viet-Nam', 'https://www.brandsvietnam.com/17836-Cac-thuong-hieu-quang-cao-nhu-the-nao-nhan-hoi-nghi-Trump-Kim-tai-Viet-Nam', ' div.reading-content', 1, '2019-10-02 08:55:35', '2020-03-03 15:57:47'),
(239, 'https://www.brandsvietnam.com/upload/news/200px/2019/17825_Neptune.png', 'Không còn lấy nước mắt người tiêu dùng, Neptune Tết năm nay thành công hay thất bại?', '17825-Khong-con-lay-nuoc-mat-nguoi-tieu-dung-Neptune-Tet-nam-nay-thanh-cong-hay-that-bai', 'https://www.brandsvietnam.com/17825-Khong-con-lay-nuoc-mat-nguoi-tieu-dung-Neptune-Tet-nam-nay-thanh-cong-hay-that-bai', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(240, 'https://www.brandsvietnam.com/upload/news/200px/2019/17821_Ytuong.jpg', 'Các chiêu \'ăn theo\' Hội nghị Trump - Kim tại Singapore', '17821-Cac-chieu-an-theo-Hoi-nghi-Trump-Kim-tai-Singapore', 'https://www.brandsvietnam.com/17821-Cac-chieu-an-theo-Hoi-nghi-Trump-Kim-tai-Singapore', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(241, 'https://www.brandsvietnam.com/upload/news/200px/2019/17808_ThePizzaCompany_Thumb.jpg', 'Nỗ lực khai thác chất liệu dân gian vào campaign Tết của The Pizza Company', '17808-No-luc-khai-thac-chat-lieu-dan-gian-vao-campaign-Tet-cua-The-Pizza-Company', 'https://www.brandsvietnam.com/17808-No-luc-khai-thac-chat-lieu-dan-gian-vao-campaign-Tet-cua-The-Pizza-Company', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(242, 'https://www.brandsvietnam.com/upload/news/200px/2019/17776_DuongsachBienHoa_Avatar.jpg', 'Chiến dịch Tết đầu tiên của đường sạch Biên Hòa chạm vào nỗi sợ Tết của người Việt', '17776-Chien-dich-Tet-dau-tien-cua-duong-sach-Bien-Hoa-cham-vao-noi-so-Tet-cua-nguoi-Viet', 'https://www.brandsvietnam.com/17776-Chien-dich-Tet-dau-tien-cua-duong-sach-Bien-Hoa-cham-vao-noi-so-Tet-cua-nguoi-Viet', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(243, 'https://www.brandsvietnam.com/upload/news/200px/2019/17747_adidas.jpg', '\"Chiến dịch bất tử\" của adidas', '17747-Chien-dich-bat-tu-cua-adidas', 'https://www.brandsvietnam.com/17747-Chien-dich-bat-tu-cua-adidas', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(244, 'https://www.brandsvietnam.com/upload/news/200px/2019/17717_BurgerKing.jpg', 'Burger King và chiến dịch chơi khăm đối thủ', '17717-Burger-King-va-chien-dich-choi-kham-doi-thu', 'https://www.brandsvietnam.com/17717-Burger-King-va-chien-dich-choi-kham-doi-thu', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(245, 'https://www.brandsvietnam.com/upload/news/200px/2019/17716_PR.jpg', 'Làm PR bằng sự sáng tạo', '17716-Lam-PR-bang-su-sang-tao', 'https://www.brandsvietnam.com/17716-Lam-PR-bang-su-sang-tao', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(246, 'https://www.brandsvietnam.com/upload/news/200px/2019/17668_MiCungDinh.png', 'Phim Tết “độc và lạ” trong chiến dịch Tết 2019', '17668-Phim-Tet-doc-va-la-trong-chien-dich-Tet-2019', 'https://www.brandsvietnam.com/17668-Phim-Tet-doc-va-la-trong-chien-dich-Tet-2019', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(247, 'https://www.brandsvietnam.com/upload/news/200px/2019/17666_Dongvat.jpg', 'Tê giác, voi quỳ \'kêu cứu\' ở sân chùa Vĩnh Nghiêm, Minh Đăng Quang', '17666-Te-giac-voi-quy-keu-cuu-o-san-chua-Vinh-Nghiem-Minh-Dang-Quang', 'https://www.brandsvietnam.com/17666-Te-giac-voi-quy-keu-cuu-o-san-chua-Vinh-Nghiem-Minh-Dang-Quang', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(248, 'https://www.brandsvietnam.com/upload/news/200px/2019/17654_Oppo.png', 'Campaign OPPO Tết 2019: Dùng điện thoại thông minh thế nào mới thông minh?', '17654-Campaign-OPPO-Tet-2019-Dung-dien-thoai-thong-minh-the-nao-moi-thong-minh', 'https://www.brandsvietnam.com/17654-Campaign-OPPO-Tet-2019-Dung-dien-thoai-thong-minh-the-nao-moi-thong-minh', ' div.reading-content', 1, '2019-10-02 08:55:35', '2020-03-03 15:55:21'),
(249, 'https://www.brandsvietnam.com/upload/news/200px/2019/17653_Durex.jpg', 'Cách Durex “lách” nghịch cảnh để làm chủ thị trường Trung Quốc', '17653-Cach-Durex-lach-nghich-canh-de-lam-chu-thi-truong-Trung-Quoc', 'https://www.brandsvietnam.com/17653-Cach-Durex-lach-nghich-canh-de-lam-chu-thi-truong-Trung-Quoc', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(250, 'https://www.brandsvietnam.com/upload/news/200px/2019/17607_Toyota.png', 'Toyota quảng bá rộng rãi dịch vụ “Bảo dưỡng xe EM60” bằng phong cách Hip-Hop', '17607-Toyota-quang-ba-rong-rai-dich-vu-Bao-duong-xe-EM60-bang-phong-cach-HipHop', 'https://www.brandsvietnam.com/17607-Toyota-quang-ba-rong-rai-dich-vu-Bao-duong-xe-EM60-bang-phong-cach-HipHop', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(251, 'https://www.brandsvietnam.com/upload/news/200px/2019/17606_TheCoffeeHouse.jpg', '\"Hai lá thư\" của The Coffee House: Chọn đề tài gai góc để lan toả thông điệp ý nghĩa', '17606-Hai-la-thu-cua-The-Coffee-House-Chon-de-tai-gai-goc-de-lan-toa-thong-diep-y-nghia', 'https://www.brandsvietnam.com/17606-Hai-la-thu-cua-The-Coffee-House-Chon-de-tai-gai-goc-de-lan-toa-thong-diep-y-nghia', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(252, 'https://www.brandsvietnam.com/upload/news/200px/2019/17576_HuuNghi.jpg', 'Tết Hữu Nghị 2019: Quên hết lo toan - Rộn ràng đón Tết', '17576-Tet-Huu-Nghi-2019-Quen-het-lo-toan-Ron-rang-don-Tet', 'https://www.brandsvietnam.com/17576-Tet-Huu-Nghi-2019-Quen-het-lo-toan-Ron-rang-don-Tet', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(253, 'https://www.brandsvietnam.com/upload/news/200px/2019/17531_OREO.png', '#OreoPeople: Khi ăn bánh cũng là cách thể hiện cá tính', '17531-OreoPeople-Khi-an-banh-cung-la-cach-the-hien-ca-tinh', 'https://www.brandsvietnam.com/17531-OreoPeople-Khi-an-banh-cung-la-cach-the-hien-ca-tinh', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35');
INSERT INTO `news` (`id`, `image`, `title`, `slug`, `content`, `post_by`, `view`, `created_at`, `updated_at`) VALUES
(254, 'https://www.brandsvietnam.com/upload/news/200px/2019/17515_Font.jpg', '9 Font chữ sáng tạo dự báo “khuynh đảo” năm 2019', '17515-9-Font-chu-sang-tao-du-bao-khuynh-dao-nam-2019', 'https://www.brandsvietnam.com/17515-9-Font-chu-sang-tao-du-bao-khuynh-dao-nam-2019', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(255, 'https://www.brandsvietnam.com/upload/news/200px/2019/17506_Thoitrang.jpg', 'Chất liệu tái chế hữu cơ sẽ là tương lai của thời trang?', '17506-Chat-lieu-tai-che-huu-co-se-la-tuong-lai-cua-thoi-trang', 'https://www.brandsvietnam.com/17506-Chat-lieu-tai-che-huu-co-se-la-tuong-lai-cua-thoi-trang', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(256, 'https://www.brandsvietnam.com/upload/news/200px/2019/17514_Website.jpg', '10 xu hướng thiết kế website trong năm 2019', '17514-10-xu-huong-thiet-ke-website-trong-nam-2019', 'https://www.brandsvietnam.com/17514-10-xu-huong-thiet-ke-website-trong-nam-2019', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(257, 'https://www.brandsvietnam.com/upload/news/200px/2019/17453_Colors.jpg', '6 màu sắc dự báo “thống trị” năm 2019', '17453-6-mau-sac-du-bao-thong-tri-nam-2019', 'https://www.brandsvietnam.com/17453-6-mau-sac-du-bao-thong-tri-nam-2019', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(258, 'https://www.brandsvietnam.com/upload/news/200px/2019/17241_PizzaHut.jpg', '19 ý tưởng quảng cáo thú vị', '17241-19-y-tuong-quang-cao-thu-vi', 'https://www.brandsvietnam.com/17241-19-y-tuong-quang-cao-thu-vi', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(259, 'https://www.brandsvietnam.com/upload/news/200px/2018/17340_DzungYoko.jpg', 'Dzũng Yoko: “Tôi chỉ là người làm nghệ thuật thời trang, không phải là nhiếp ảnh gia\"', '17340-Dzung-Yoko-Toi-chi-la-nguoi-lam-nghe-thuat-thoi-trang-khong-phai-la-nhiep-anh-gia', 'https://www.brandsvietnam.com/17340-Dzung-Yoko-Toi-chi-la-nguoi-lam-nghe-thuat-thoi-trang-khong-phai-la-nhiep-anh-gia', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(260, 'https://www.brandsvietnam.com/upload/news/200px/2018/17330_ChateauDaLat.png', '“Vụ trộm lâu đài vang - La Casse” - phim ngắn hành động khơi gợi niềm tự hào vang Việt', '17330-Vu-trom-lau-dai-vang-La-Casse-phim-ngan-hanh-dong-khoi-goi-niem-tu-hao-vang-Viet', 'https://www.brandsvietnam.com/17330-Vu-trom-lau-dai-vang-La-Casse-phim-ngan-hanh-dong-khoi-goi-niem-tu-hao-vang-Viet', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(261, 'https://www.brandsvietnam.com/upload/news/200px/2018/17205_Pantone.jpg', 'Pantone công bố \"Living Coral\" là màu sắc của năm 2019', '17205-Pantone-cong-bo-Living-Coral-la-mau-sac-cua-nam-2019', 'https://www.brandsvietnam.com/17205-Pantone-cong-bo-Living-Coral-la-mau-sac-cua-nam-2019', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(262, 'https://www.brandsvietnam.com/upload/news/200px/2018/17158_CocaCola.png', '“Cùng Coca-Cola tri ân thầy cô” – Sức mạnh của marketing activation khi kết hợp cùng digital', '17158-Cung-CocaCola-tri-an-thay-co-Suc-manh-cua-marketing-activation-khi-ket-hop-cung-digital', 'https://www.brandsvietnam.com/17158-Cung-CocaCola-tri-an-thay-co-Suc-manh-cua-marketing-activation-khi-ket-hop-cung-digital', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(263, 'https://www.brandsvietnam.com/upload/news/200px/2018/17156_Shutterstock.jpg', 'Shutterstock: 3 màu sắc thịnh hành nhất năm 2019', '17156-Shutterstock-3-mau-sac-thinh-hanh-nhat-nam-2019', 'https://www.brandsvietnam.com/17156-Shutterstock-3-mau-sac-thinh-hanh-nhat-nam-2019', ' div.reading-content', 0, '2019-10-02 08:55:35', '2019-10-02 08:55:35'),
(264, 'https://www.brandsvietnam.com/upload/news/200px/2018/17085_LexusES.jpg', 'Video quảng cáo đầu tiên do trí thông minh nhân tạo AI viết kịch bản', '17085-Video-quang-cao-dau-tien-do-tri-thong-minh-nhan-tao-AI-viet-kich-ban', 'https://www.brandsvietnam.com/17085-Video-quang-cao-dau-tien-do-tri-thong-minh-nhan-tao-AI-viet-kich-ban', ' div.reading-content', 1, '2019-10-02 08:55:36', '2020-03-23 20:06:45'),
(265, 'https://www.brandsvietnam.com/upload/news/200px/2018/16943_Dulux.jpg', 'The Brief #6: Dulux - Bảo vệ hải đăng', 'tieudiem', 'https://www.brandsvietnam.com/tieudiem/16943-The-Brief-6-Dulux-Bao-ve-hai-dang', ' div.reading-content', 1, '2019-10-02 08:55:36', '2020-03-03 16:05:42'),
(266, 'https://www.brandsvietnam.com/upload/news/200px/2018/16958_OMO.PNG', '“Tạm rời màn hình, trải nghiệm cuộc sống” - OMO dùng công nghệ giải quyết vấn đề của công nghệ', '16958-Tam-roi-man-hinh-trai-nghiem-cuoc-song-OMO-dung-cong-nghe-giai-quyet-van-de-cua-cong-nghe', 'https://www.brandsvietnam.com/16958-Tam-roi-man-hinh-trai-nghiem-cuoc-song-OMO-dung-cong-nghe-giai-quyet-van-de-cua-cong-nghe', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(267, 'https://www.brandsvietnam.com/upload/news/200px/2018/16918_Dove.jpg', 'Thương hiệu và khả năng thấu cảm', '16918-Thuong-hieu-va-kha-nang-thau-cam', 'https://www.brandsvietnam.com/16918-Thuong-hieu-va-kha-nang-thau-cam', ' div.reading-content', 1, '2019-10-02 08:55:36', '2020-03-03 15:50:42'),
(268, 'https://www.brandsvietnam.com/upload/news/200px/2019/19253_0.png', '\"Tam quốc tranh hùng\" thị trường smartphone Việt Nam', '19253-Tam-quoc-tranh-hung-thi-truong-smartphone-Viet-Nam', 'https://www.brandsvietnam.com/19253-Tam-quoc-tranh-hung-thi-truong-smartphone-Viet-Nam', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(269, 'https://www.brandsvietnam.com/upload/news/200px/2019/19260_80.jpg', 'Doanh thu từ ngành bán lẻ tiếp tục đà tăng trưởng', '19260-Doanh-thu-tu-nganh-ban-le-tiep-tuc-da-tang-truong', 'https://www.brandsvietnam.com/19260-Doanh-thu-tu-nganh-ban-le-tiep-tuc-da-tang-truong', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(270, 'https://www.brandsvietnam.com/upload/news/200px/2019/19252_16.jpg', 'Thị trường tablet tại Việt Nam tiếp tục giảm sút', '19252-Thi-truong-tablet-tai-Viet-Nam-tiep-tuc-giam-sut', 'https://www.brandsvietnam.com/19252-Thi-truong-tablet-tai-Viet-Nam-tiep-tuc-giam-sut', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(271, 'https://www.brandsvietnam.com/upload/news/200px/2019/19247_9.jpg', '[Infographic] Toàn cảnh kinh tế xã hội 9 tháng đầu năm 2019 qua những con số', '19247-Infographic-Toan-canh-kinh-te-xa-hoi-9-thang-dau-nam-2019-qua-nhung-con-so', 'https://www.brandsvietnam.com/19247-Infographic-Toan-canh-kinh-te-xa-hoi-9-thang-dau-nam-2019-qua-nhung-con-so', ' div.reading-content', 1, '2019-10-02 08:55:36', '2020-03-03 15:58:04'),
(272, 'https://www.brandsvietnam.com/upload/news/200px/2019/5_1569802713.jpg', 'Nhập khẩu ô tô đạt 2,4 tỷ USD từ đầu năm', '19248-Nhap-khau-o-to-dat-24-ty-USD-tu-dau-nam', 'https://www.brandsvietnam.com/19248-Nhap-khau-o-to-dat-24-ty-USD-tu-dau-nam', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(273, 'https://www.brandsvietnam.com/upload/news/200px/2019/19237_24.jpg', 'Cuộc đua thị trường đặt phòng trực tuyến', '19237-Cuoc-dua-thi-truong-dat-phong-truc-tuyen', 'https://www.brandsvietnam.com/19237-Cuoc-dua-thi-truong-dat-phong-truc-tuyen', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(274, 'https://www.brandsvietnam.com/upload/news/200px/2019/19231_7.jpg', 'Khách hàng đang dần dần rời xa chợ truyền thống?', '19231-Khach-hang-dang-dan-dan-roi-xa-cho-truyen-thong', 'https://www.brandsvietnam.com/19231-Khach-hang-dang-dan-dan-roi-xa-cho-truyen-thong', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(275, 'https://www.brandsvietnam.com/upload/news/200px/2019/19218_13.jpg', 'Mua ô tô trên thương mại điện tử ngày càng tăng', '19218-Mua-o-to-tren-thuong-mai-dien-tu-ngay-cang-tang', 'https://www.brandsvietnam.com/19218-Mua-o-to-tren-thuong-mai-dien-tu-ngay-cang-tang', ' div.reading-content', 1, '2019-10-02 08:55:36', '2020-03-03 15:57:52'),
(276, 'https://www.brandsvietnam.com/upload/news/200px/2019/19203_10.jpeg', 'Tình hình hoạt động của các mạng xã hội \'Made in Vietnam\'', '19203-Tinh-hinh-hoat-dong-cua-cac-mang-xa-hoi-Made-in-Vietnam', 'https://www.brandsvietnam.com/19203-Tinh-hinh-hoat-dong-cua-cac-mang-xa-hoi-Made-in-Vietnam', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(277, 'https://www.brandsvietnam.com/upload/news/200px/2019/19205_15.jpg', 'Lại sắp nóng M&A ngành ngân hàng', '19205-Lai-sap-nong-MA-nganh-ngan-hang', 'https://www.brandsvietnam.com/19205-Lai-sap-nong-MA-nganh-ngan-hang', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(278, 'https://www.brandsvietnam.com/upload/news/200px/2019/19207_4.jpg', 'Doanh nghiệp hướng đến tiêu dùng xanh', '19207-Doanh-nghiep-huong-den-tieu-dung-xanh', 'https://www.brandsvietnam.com/19207-Doanh-nghiep-huong-den-tieu-dung-xanh', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(279, 'https://www.brandsvietnam.com/upload/news/200px/2019/19200_Hangkhong.jpg', 'Các hãng hàng không bắt đầu lo mất thị phần', '19200-Cac-hang-hang-khong-bat-dau-lo-mat-thi-phan', 'https://www.brandsvietnam.com/19200-Cac-hang-hang-khong-bat-dau-lo-mat-thi-phan', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(280, 'https://www.brandsvietnam.com/upload/news/200px/2019/19195_16.jpeg', 'Cuộc cạnh tranh khốc liệt của các \"siêu ứng dụng\" tại châu Á', '19195-Cuoc-canh-tranh-khoc-liet-cua-cac-sieu-ung-dung-tai-chau-A', 'https://www.brandsvietnam.com/19195-Cuoc-canh-tranh-khoc-liet-cua-cac-sieu-ung-dung-tai-chau-A', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(281, 'https://www.brandsvietnam.com/upload/news/200px/2019/19191_2.jpg', 'Cà phê là nạn nhân trực tiếp của cuộc chiến tranh thương mại Mỹ - Trung Quốc', '19191-Ca-phe-la-nan-nhan-truc-tiep-cua-cuoc-chien-tranh-thuong-mai-My-Trung-Quoc', 'https://www.brandsvietnam.com/19191-Ca-phe-la-nan-nhan-truc-tiep-cua-cuoc-chien-tranh-thuong-mai-My-Trung-Quoc', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(282, 'https://www.brandsvietnam.com/upload/news/200px/2019/19190_15.jpg', 'Thay đổi du lịch từ công nghệ dữ liệu', '19190-Thay-doi-du-lich-tu-cong-nghe-du-lieu', 'https://www.brandsvietnam.com/19190-Thay-doi-du-lich-tu-cong-nghe-du-lieu', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(283, 'https://www.brandsvietnam.com/upload/news/200px/2019/19189_12.jpg', 'Việt Nam muốn vào danh sách hệ sinh thái khởi nghiệp hàng đầu Đông Nam Á', '19189-Viet-Nam-muon-vao-danh-sach-he-sinh-thai-khoi-nghiep-hang-dau-Dong-Nam-A', 'https://www.brandsvietnam.com/19189-Viet-Nam-muon-vao-danh-sach-he-sinh-thai-khoi-nghiep-hang-dau-Dong-Nam-A', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(284, 'https://www.brandsvietnam.com/upload/news/200px/2019/19178_2.jpg', 'Việt Nam thuộc nhóm phát tán trang web lừa đảo nhiều nhất Đông Nam Á', '19178-Viet-Nam-thuoc-nhom-phat-tan-trang-web-lua-dao-nhieu-nhat-Dong-Nam-A', 'https://www.brandsvietnam.com/19178-Viet-Nam-thuoc-nhom-phat-tan-trang-web-lua-dao-nhieu-nhat-Dong-Nam-A', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(285, 'https://www.brandsvietnam.com/upload/news/200px/2019/19184_20.jpg', 'Thương hiệu bán lẻ ngoại: Vào - ra, sống - chết', '19184-Thuong-hieu-ban-le-ngoai-Vao-ra-song-chet', 'https://www.brandsvietnam.com/19184-Thuong-hieu-ban-le-ngoai-Vao-ra-song-chet', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(286, 'https://www.brandsvietnam.com/upload/news/200px/2019/19145_3.jpg', 'Tiêu dùng nhanh đi vội lên trực tuyến', '19145-Tieu-dung-nhanh-di-voi-len-truc-tuyen', 'https://www.brandsvietnam.com/19145-Tieu-dung-nhanh-di-voi-len-truc-tuyen', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(287, 'https://www.brandsvietnam.com/upload/news/200px/2019/105_1568110718.jpg', 'Airbnb, Agoda, Booking dần lấy thị phần khách sạn bình dân', '19169-Airbnb-Agoda-Booking-dan-lay-thi-phan-khach-san-binh-dan', 'https://www.brandsvietnam.com/19169-Airbnb-Agoda-Booking-dan-lay-thi-phan-khach-san-binh-dan', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(288, 'https://www.brandsvietnam.com/upload/news/200px/2019/19165_7.jpg', 'Thị trường bia, cà phê vỉa hè hơn 3 tỷ USD', '19165-Thi-truong-bia-ca-phe-via-he-hon-3-ty-USD', 'https://www.brandsvietnam.com/19165-Thi-truong-bia-ca-phe-via-he-hon-3-ty-USD', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(289, 'https://www.brandsvietnam.com/upload/news/200px/2019/19149_103.jpg', 'Ngân hàng  hai bảng nợ xấu', '19149-Ngan-hang-hai-bang-no-xau', 'https://www.brandsvietnam.com/19149-Ngan-hang-hai-bang-no-xau', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(290, 'https://www.brandsvietnam.com/upload/news/200px/2019/19138_3.jpg', 'Nội địa hoá được 5%: Doanh nghiệp Việt đánh mất mình trong thị trường điện tử 12 tỷ USD', '19138-Noi-dia-hoa-duoc-5-Doanh-nghiep-Viet-danh-mat-minh-trong-thi-truong-dien-tu-12-ty-USD', 'https://www.brandsvietnam.com/19138-Noi-dia-hoa-duoc-5-Doanh-nghiep-Viet-danh-mat-minh-trong-thi-truong-dien-tu-12-ty-USD', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(291, 'https://www.brandsvietnam.com/upload/news/200px/2019/19146_11.jpg', 'Sóng ngầm vay ngang hàng', '19146-Song-ngam-vay-ngang-hang', 'https://www.brandsvietnam.com/19146-Song-ngam-vay-ngang-hang', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(292, 'https://www.brandsvietnam.com/upload/news/200px/2019/19147_1.png', 'Hưởng lợi từ thương chiến, xuất khẩu điện thoại của Việt Nam tăng mạnh', '19147-Huong-loi-tu-thuong-chien-xuat-khau-dien-thoai-cua-Viet-Nam-tang-manh', 'https://www.brandsvietnam.com/19147-Huong-loi-tu-thuong-chien-xuat-khau-dien-thoai-cua-Viet-Nam-tang-manh', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(293, 'https://www.brandsvietnam.com/upload/news/200px/2019/19151_2.jpg', 'Sức hấp dẫn của thị trường mỹ phẩm', '19151-Suc-hap-dan-cua-thi-truong-my-pham', 'https://www.brandsvietnam.com/19151-Suc-hap-dan-cua-thi-truong-my-pham', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(294, 'https://www.brandsvietnam.com/upload/news/200px/2019/19158_19158_Ava_1.jpg', 'Quảng cáo trên Facebook, Google, YouTube: Doanh nghiệp phải nộp thay thuế nhà thầu', '19158-Quang-cao-tren-Facebook-Google-YouTube-Doanh-nghiep-phai-nop-thay-thue-nha-thau', 'https://www.brandsvietnam.com/19158-Quang-cao-tren-Facebook-Google-YouTube-Doanh-nghiep-phai-nop-thay-thue-nha-thau', ' div.reading-content', 0, '2019-10-02 08:55:36', '2019-10-02 08:55:36'),
(295, 'https://www.brandsvietnam.com/upload/news/200px/2019/19137_9.png', 'Việt Nam có thêm 2 ngành hàng xuất khẩu 10 tỷ USD', '19137-Viet-Nam-co-them-2-nganh-hang-xuat-khau-10-ty-USD', 'https://www.brandsvietnam.com/19137-Viet-Nam-co-them-2-nganh-hang-xuat-khau-10-ty-USD', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(296, 'https://www.brandsvietnam.com/upload/news/200px/2019/19132_6.jpg', 'Thêm công ty được cấp phép trung gian thanh toán', '19132-Them-cong-ty-duoc-cap-phep-trung-gian-thanh-toan', 'https://www.brandsvietnam.com/19132-Them-cong-ty-duoc-cap-phep-trung-gian-thanh-toan', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(297, 'https://www.brandsvietnam.com/upload/news/200px/2019/19128_16.jpg', 'Thế lưỡng cực trong thị trường bán lẻ Việt Nam', '19128-The-luong-cuc-trong-thi-truong-ban-le-Viet-Nam', 'https://www.brandsvietnam.com/19128-The-luong-cuc-trong-thi-truong-ban-le-Viet-Nam', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(298, 'https://www.brandsvietnam.com/upload/news/200px/2019/19125_Ava_1_1567487485.jpg', 'Chi tiêu cho FMCG tăng mạnh ở Nông thôn', '19130-Chi-tieu-cho-FMCG-tang-manh-o-Nong-thon', 'https://www.brandsvietnam.com/19130-Chi-tieu-cho-FMCG-tang-manh-o-Nong-thon', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(299, 'https://www.brandsvietnam.com/upload/news/200px/2019/12_1567410383.jpg', 'Thương mại điện tử đua đầu tư kho vận hậu cần', '19124-Thuong-mai-dien-tu-dua-dau-tu-kho-van-hau-can', 'https://www.brandsvietnam.com/19124-Thuong-mai-dien-tu-dua-dau-tu-kho-van-hau-can', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(300, 'https://www.brandsvietnam.com/upload/news/200px/2019/19109_10.jpg', 'Chính phủ ủng hộ Kinh tế chia sẻ', '19109-Chinh-phu-ung-ho-Kinh-te-chia-se', 'https://www.brandsvietnam.com/19109-Chinh-phu-ung-ho-Kinh-te-chia-se', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(301, 'https://www.brandsvietnam.com/upload/news/200px/2019/19120_4.jpg', 'Hàng không chạy đua vé rẻ', '19120-Hang-khong-chay-dua-ve-re', 'https://www.brandsvietnam.com/19120-Hang-khong-chay-dua-ve-re', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(302, 'https://www.brandsvietnam.com/upload/news/200px/2019/19122_2.jpg', 'Du lịch Việt thu được bao nhiêu từ du khách trong 8 tháng?', '19122-Du-lich-Viet-thu-duoc-bao-nhieu-tu-du-khach-trong-8-thang', 'https://www.brandsvietnam.com/19122-Du-lich-Viet-thu-duoc-bao-nhieu-tu-du-khach-trong-8-thang', ' div.reading-content', 1, '2019-10-02 08:55:37', '2020-03-03 15:57:56'),
(303, 'https://www.brandsvietnam.com/upload/news/200px/2019/19119_news-facebook-account-kit.jpg', 'Người dùng Việt Nam bị nhận nhiều tin nhắn lạ từ Facebook', '19119-Nguoi-dung-Viet-Nam-bi-nhan-nhieu-tin-nhan-la-tu-Facebook', 'https://www.brandsvietnam.com/19119-Nguoi-dung-Viet-Nam-bi-nhan-nhieu-tin-nhan-la-tu-Facebook', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(304, 'https://www.brandsvietnam.com/upload/news/200px/2019/19099_4.jpg', 'Thặng dư thương mại hàng hoá đã đạt 2,9 tỷ USD', '19099-Thang-du-thuong-mai-hang-hoa-da-dat-29-ty-USD', 'https://www.brandsvietnam.com/19099-Thang-du-thuong-mai-hang-hoa-da-dat-29-ty-USD', ' div.reading-content', 5, '2019-10-02 08:55:37', '2020-03-03 16:30:27'),
(305, 'https://www.brandsvietnam.com/upload/news/200px/2019/19115_19115_Ava_1.jpg', 'Sau 20h sẽ không còn cuộc gọi quảng cáo?', '19115-Sau-20h-se-khong-con-cuoc-goi-quang-cao', 'https://www.brandsvietnam.com/19115-Sau-20h-se-khong-con-cuoc-goi-quang-cao', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(306, 'https://www.brandsvietnam.com/upload/news/200px/2019/19113_19113_Ava_1.jpg', 'Cơ cấu khách quốc tế quá lệch, cách nào cho du lịch đa dạng thị trường?', '19113-Co-cau-khach-quoc-te-qua-lech-cach-nao-cho-du-lich-da-dang-thi-truong', 'https://www.brandsvietnam.com/19113-Co-cau-khach-quoc-te-qua-lech-cach-nao-cho-du-lich-da-dang-thi-truong', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(307, 'https://www.brandsvietnam.com/upload/news/200px/2019/19078_19078_Ava_1.jpg', 'Edtech Việt Nam - chạm tay vào một giấc mơ toàn cầu', '19078-Edtech-Viet-Nam-cham-tay-vao-mot-giac-mo-toan-cau', 'https://www.brandsvietnam.com/19078-Edtech-Viet-Nam-cham-tay-vao-mot-giac-mo-toan-cau', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(308, 'https://www.brandsvietnam.com/upload/news/200px/2019/19091_16.jpg', 'Bánh Trung thu: Trong nước tăng, xuất khẩu giảm', '19091-Banh-Trung-thu-Trong-nuoc-tang-xuat-khau-giam', 'https://www.brandsvietnam.com/19091-Banh-Trung-thu-Trong-nuoc-tang-xuat-khau-giam', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(309, 'https://www.brandsvietnam.com/upload/news/200px/2019/19060_6.jpg', 'ESPORTS: Cuộc đấu tỉ đô', '19060-ESPORTS-Cuoc-dau-ti-do', 'https://www.brandsvietnam.com/19060-ESPORTS-Cuoc-dau-ti-do', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(310, 'https://www.brandsvietnam.com/upload/news/200px/2019/19070_10.jpg', 'Bứt phá M&A: Tháo nút thắt chính sách', '19070-But-pha-MA-Thao-nut-that-chinh-sach', 'https://www.brandsvietnam.com/19070-But-pha-MA-Thao-nut-that-chinh-sach', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(311, 'https://www.brandsvietnam.com/upload/news/200px/2019/19067_13.jpg', 'Xuất khẩu qua Alibaba & Amazon', '19067-Xuat-khau-qua-Alibaba-Amazon', 'https://www.brandsvietnam.com/19067-Xuat-khau-qua-Alibaba-Amazon', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(312, 'https://www.brandsvietnam.com/upload/news/200px/2019/19069_7.jpg', 'Thị trường giao hàng nhanh: Cuộc đua công nghệ', '19069-Thi-truong-giao-hang-nhanh-Cuoc-dua-cong-nghe', 'https://www.brandsvietnam.com/19069-Thi-truong-giao-hang-nhanh-Cuoc-dua-cong-nghe', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(313, 'https://www.brandsvietnam.com/upload/news/200px/2019/19071_4.jpg', 'Vay tiêu dùng vào cuộc đua mới', '19071-Vay-tieu-dung-vao-cuoc-dua-moi', 'https://www.brandsvietnam.com/19071-Vay-tieu-dung-vao-cuoc-dua-moi', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(314, 'https://www.brandsvietnam.com/upload/news/200px/2019/19062_9.jpg', 'GrabFood, Go-Food bùng nổ, các cửa hàng truyền thống có lao đao?', '19062-GrabFood-GoFood-bung-no-cac-cua-hang-truyen-thong-co-lao-dao', 'https://www.brandsvietnam.com/19062-GrabFood-GoFood-bung-no-cac-cua-hang-truyen-thong-co-lao-dao', ' div.reading-content', 1, '2019-10-02 08:55:37', '2020-03-03 16:35:47'),
(315, 'https://www.brandsvietnam.com/upload/news/200px/2019/19064_1.jpg', 'Bùng nổ nhượng quyền thương hiệu', '19064-Bung-no-nhuong-quyen-thuong-hieu', 'https://www.brandsvietnam.com/19064-Bung-no-nhuong-quyen-thuong-hieu', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(316, 'https://www.brandsvietnam.com/upload/news/200px/2019/11_1566286123.jpg', 'Hơn nửa đầu năm 2019, ô tô nhập khẩu tăng 500%', '19059-Hon-nua-dau-nam-2019-o-to-nhap-khau-tang-500', 'https://www.brandsvietnam.com/19059-Hon-nua-dau-nam-2019-o-to-nhap-khau-tang-500', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(317, 'https://www.brandsvietnam.com/upload/news/200px/2019/19050_3.jpg', 'Thị trường smartphone: Oppo “đe dọa” vị trí số 1 của Samsung', '19050-Thi-truong-smartphone-Oppo-de-doa-vi-tri-so-1-cua-Samsung', 'https://www.brandsvietnam.com/19050-Thi-truong-smartphone-Oppo-de-doa-vi-tri-so-1-cua-Samsung', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(318, 'https://www.brandsvietnam.com/upload/news/200px/2019/19045_2.jpg', 'Việt Nam chi hơn 4,3 tỷ USD nhập ô tô, linh kiện phụ tùng', '19045-Viet-Nam-chi-hon-43-ty-USD-nhap-o-to-linh-kien-phu-tung', 'https://www.brandsvietnam.com/19045-Viet-Nam-chi-hon-43-ty-USD-nhap-o-to-linh-kien-phu-tung', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(319, 'https://www.brandsvietnam.com/upload/news/200px/2019/19048_8.jpg', 'Ngành FMCG sẽ tận dụng dữ liệu khách hàng để cá nhân hoá tiêu dùng', '19048-Nganh-FMCG-se-tan-dung-du-lieu-khach-hang-de-ca-nhan-hoa-tieu-dung', 'https://www.brandsvietnam.com/19048-Nganh-FMCG-se-tan-dung-du-lieu-khach-hang-de-ca-nhan-hoa-tieu-dung', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(320, 'https://www.brandsvietnam.com/upload/news/200px/2019/19025_5.jpg', 'Sau Vingroup và Masan, SK Group tiếp tục tìm thương vụ mới tại Việt Nam', '19025-Sau-Vingroup-va-Masan-SK-Group-tiep-tuc-tim-thuong-vu-moi-tai-Viet-Nam', 'https://www.brandsvietnam.com/19025-Sau-Vingroup-va-Masan-SK-Group-tiep-tuc-tim-thuong-vu-moi-tai-Viet-Nam', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(321, 'https://www.brandsvietnam.com/upload/news/200px/2019/19041_19040_Ava_1.jpg', 'Grab và Go-Jek đang hơn thua nhau thế nào ở Đông Nam Á?', '19041-Grab-va-GoJek-dang-hon-thua-nhau-the-nao-o-Dong-Nam-A', 'https://www.brandsvietnam.com/19041-Grab-va-GoJek-dang-hon-thua-nhau-the-nao-o-Dong-Nam-A', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(322, 'https://www.brandsvietnam.com/upload/news/200px/2019/19040_19040_Ava_1.jpg', 'Du khách nội – ngoại: Ai mang lại nguồn thu lớn hơn?', '19040-Du-khach-noi-ngoai-Ai-mang-lai-nguon-thu-lon-hon', 'https://www.brandsvietnam.com/19040-Du-khach-noi-ngoai-Ai-mang-lai-nguon-thu-lon-hon', ' div.reading-content', 0, '2019-10-02 08:55:37', '2019-10-02 08:55:37'),
(323, 'https://www.brandsvietnam.com/upload/news/200px/2019/19044_1003.jpg', 'Thị trường mỹ phẩm hút nhà đầu tư mới', '19044-Thi-truong-my-pham-hut-nha-dau-tu-moi', 'https://www.brandsvietnam.com/19044-Thi-truong-my-pham-hut-nha-dau-tu-moi', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(324, 'https://www.brandsvietnam.com/upload/news/200px/2019/19023_Yola.png', 'Vốn tư nhân đang đổ vào những dự án giáo dục nào?', '19023-Von-tu-nhan-dang-do-vao-nhung-du-an-giao-duc-nao', 'https://www.brandsvietnam.com/19023-Von-tu-nhan-dang-do-vao-nhung-du-an-giao-duc-nao', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(325, 'https://www.brandsvietnam.com/upload/news/200px/2019/19039_19039_Ava_1.jpg', 'Cửa hàng nhỏ đóng cửa ồ ạt, vì sao TGDĐ mở chuỗi Điện Thoại Siêu Rẻ?', '19039-Cua-hang-nho-dong-cua-o-at-vi-sao-TGDD-mo-chuoi-Dien-Thoai-Sieu-Re', 'https://www.brandsvietnam.com/19039-Cua-hang-nho-dong-cua-o-at-vi-sao-TGDD-mo-chuoi-Dien-Thoai-Sieu-Re', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(326, 'https://www.brandsvietnam.com/upload/news/200px/2019/19037_6.jpg', 'Taxi truyền thống Hà Nội muốn chuyển sang mô hình như Grab', '19037-Taxi-truyen-thong-Ha-Noi-muon-chuyen-sang-mo-hinh-nhu-Grab', 'https://www.brandsvietnam.com/19037-Taxi-truyen-thong-Ha-Noi-muon-chuyen-sang-mo-hinh-nhu-Grab', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(327, 'https://www.brandsvietnam.com/upload/news/200px/2019/19027_artificialintelligence5-1.jpg', 'Chỉ 1% các startup trên thế giới đang sử dụng công nghệ AI', '19027-Chi-1-cac-startup-tren-the-gioi-dang-su-dung-cong-nghe-AI', 'https://www.brandsvietnam.com/19027-Chi-1-cac-startup-tren-the-gioi-dang-su-dung-cong-nghe-AI', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(328, 'https://www.brandsvietnam.com/upload/news/200px/2019/19163_19.jpg', 'Bất hòa nhận thức: Cách người bán thay đổi niềm tin người mua qua marketing', '19163-Bat-hoa-nhan-thuc-Cach-nguoi-ban-thay-doi-niem-tin-nguoi-mua-qua-marketing', 'https://www.brandsvietnam.com/19163-Bat-hoa-nhan-thuc-Cach-nguoi-ban-thay-doi-niem-tin-nguoi-mua-qua-marketing', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(329, 'https://www.brandsvietnam.com/upload/news/200px/2019/19141_4.jpg', '6 lời khuyên để đời của tỷ phú Warren Buffett', '19141-6-loi-khuyen-de-doi-cua-ty-phu-Warren-Buffett', 'https://www.brandsvietnam.com/19141-6-loi-khuyen-de-doi-cua-ty-phu-Warren-Buffett', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(330, 'https://www.brandsvietnam.com/upload/news/200px/2019/19110_1.jpg', 'Sai lầm cần tránh trong thiết kế cửa hàng bán lẻ', '19110-Sai-lam-can-tranh-trong-thiet-ke-cua-hang-ban-le', 'https://www.brandsvietnam.com/19110-Sai-lam-can-tranh-trong-thiet-ke-cua-hang-ban-le', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(331, 'https://www.brandsvietnam.com/upload/news/200px/2019/18333_18333_SmartR_Avatar.png', 'Blended Learning: Phương pháp trị bệnh “lười học” tiếng Anh của dân công sở', '18333-Blended-Learning-Phuong-phap-tri-benh-luoi-hoc-tieng-Anh-cua-dan-cong-so', 'https://www.brandsvietnam.com/18333-Blended-Learning-Phuong-phap-tri-benh-luoi-hoc-tieng-Anh-cua-dan-cong-so', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(332, 'https://www.brandsvietnam.com/upload/news/200px/2019/18973_18973_Ava_1.jpg', 'Chuyển đổi văn hóa doanh nghiệp phù hợp “Kỷ nguyên số”', '18973-Chuyen-doi-van-hoa-doanh-nghiep-phu-hop-Ky-nguyen-so', 'https://www.brandsvietnam.com/18973-Chuyen-doi-van-hoa-doanh-nghiep-phu-hop-Ky-nguyen-so', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(333, 'https://www.brandsvietnam.com/upload/news/200px/2019/18946_5.jpg', 'Nâng tầm thương hiệu: Thời bán lẻ kiểu mới', '18946-Nang-tam-thuong-hieu-Thoi-ban-le-kieu-moi', 'https://www.brandsvietnam.com/18946-Nang-tam-thuong-hieu-Thoi-ban-le-kieu-moi', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(334, 'https://www.brandsvietnam.com/upload/news/200px/2019/18862_LEADERSHIP.jpg', '4 đặc điểm giúp nhân viên bình thường thành CEO', '18862-4-dac-diem-giup-nhan-vien-binh-thuong-thanh-CEO', 'https://www.brandsvietnam.com/18862-4-dac-diem-giup-nhan-vien-binh-thuong-thanh-CEO', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(335, 'https://www.brandsvietnam.com/upload/news/200px/2019/18863_hand-holding-magnet.jpg', '4 kiểu phong cách quản lý giữ chân người tài của sếp có tầm', '18863-4-kieu-phong-cach-quan-ly-giu-chan-nguoi-tai-cua-sep-co-tam', 'https://www.brandsvietnam.com/18863-4-kieu-phong-cach-quan-ly-giu-chan-nguoi-tai-cua-sep-co-tam', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(336, 'https://www.brandsvietnam.com/upload/news/200px/2019/18833_3.jpg', 'Chiến lược định vị ngày nay có mới?', '18833-Chien-luoc-dinh-vi-ngay-nay-co-moi', 'https://www.brandsvietnam.com/18833-Chien-luoc-dinh-vi-ngay-nay-co-moi', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(337, 'https://www.brandsvietnam.com/upload/news/200px/2019/18760_changes_to_family_law_ontario.jpg', 'Luật cạnh tranh 2018: Làm rõ tiêu chí xác định doanh nghiệp thống lĩnh thị trường', '18760-Luat-canh-tranh-2018-Lam-ro-tieu-chi-xac-dinh-doanh-nghiep-thong-linh-thi-truong', 'https://www.brandsvietnam.com/18760-Luat-canh-tranh-2018-Lam-ro-tieu-chi-xac-dinh-doanh-nghiep-thong-linh-thi-truong', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(338, 'https://www.brandsvietnam.com/upload/news/200px/2019/18730_Apples-keynote-event_Tim_Cook.jpg', 'Để thuyết trình ra mắt sản phẩm mới đạt hiệu quả cao như Apple', '18730-De-thuyet-trinh-ra-mat-san-pham-moi-dat-hieu-qua-cao-nhu-Apple', 'https://www.brandsvietnam.com/18730-De-thuyet-trinh-ra-mat-san-pham-moi-dat-hieu-qua-cao-nhu-Apple', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(339, 'https://www.brandsvietnam.com/upload/news/200px/2019/18718_Service.jpg', 'Servqual: Mô hình 5 khoảng cách để cải thiện chất lượng dịch vụ', '18718-Servqual-Mo-hinh-5-khoang-cach-de-cai-thien-chat-luong-dich-vu', 'https://www.brandsvietnam.com/18718-Servqual-Mo-hinh-5-khoang-cach-de-cai-thien-chat-luong-dich-vu', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(340, 'https://www.brandsvietnam.com/upload/news/200px/2019/18688_CannesLions.jpg', 'Học thêm từ Cannes Lions bằng 3 câu hỏi', '18688-Hoc-them-tu-Cannes-Lions-bang-3-cau-hoi', 'https://www.brandsvietnam.com/18688-Hoc-them-tu-Cannes-Lions-bang-3-cau-hoi', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(341, 'https://www.brandsvietnam.com/upload/news/200px/2019/18664_avatar.jpg', 'Chọn đại sứ thương hiệu dễ hay khó? Các nhãn hàng đã chọn đại sứ cho mình như thế nào?', '18664-Chon-dai-su-thuong-hieu-de-hay-kho-Cac-nhan-hang-da-chon-dai-su-cho-minh-nhu-the-nao', 'https://www.brandsvietnam.com/18664-Chon-dai-su-thuong-hieu-de-hay-kho-Cac-nhan-hang-da-chon-dai-su-cho-minh-nhu-the-nao', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(342, 'https://www.brandsvietnam.com/upload/news/200px/2019/18622_Design.jpg', 'Bí quyết làm slide thuyết trình ấn tượng', '18622-Bi-quyet-lam-slide-thuyet-trinh-an-tuong', 'https://www.brandsvietnam.com/18622-Bi-quyet-lam-slide-thuyet-trinh-an-tuong', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(343, 'https://www.brandsvietnam.com/upload/news/200px/2019/18569_elon-musk.jpg', 'Năm bài học từ hành trình khởi nghiệp của Elon Musk', '18569-Nam-bai-hoc-tu-hanh-trinh-khoi-nghiep-cua-Elon-Musk', 'https://www.brandsvietnam.com/18569-Nam-bai-hoc-tu-hanh-trinh-khoi-nghiep-cua-Elon-Musk', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(344, 'https://www.brandsvietnam.com/upload/news/200px/2019/18576_GreyCells.jpg', 'Con người - Yếu tố quan trọng nhất trong dịch vụ', '18576-Con-nguoi-Yeu-to-quan-trong-nhat-trong-dich-vu', 'https://www.brandsvietnam.com/18576-Con-nguoi-Yeu-to-quan-trong-nhat-trong-dich-vu', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(345, 'https://www.brandsvietnam.com/upload/news/200px/2019/18557_SteveJobs.jpg', 'Steve Jobs \'thao túng\' người khác như thế nào?', '18557-Steve-Jobs-thao-tung-nguoi-khac-nhu-the-nao', 'https://www.brandsvietnam.com/18557-Steve-Jobs-thao-tung-nguoi-khac-nhu-the-nao', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(346, 'https://www.brandsvietnam.com/upload/news/200px/2019/18547_Paying.jpg', '2 câu hỏi khám phá thói quen tiêu xài của khách hàng', '18547-2-cau-hoi-kham-pha-thoi-quen-tieu-xai-cua-khach-hang', 'https://www.brandsvietnam.com/18547-2-cau-hoi-kham-pha-thoi-quen-tieu-xai-cua-khach-hang', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(347, 'https://www.brandsvietnam.com/upload/news/200px/2019/18419_Leadership.jpg', '5 chiến lược thú vị giúp bạn xây dựng kĩ năng lãnh đạo', '18419-5-chien-luoc-thu-vi-giup-ban-xay-dung-ki-nang-lanh-dao', 'https://www.brandsvietnam.com/18419-5-chien-luoc-thu-vi-giup-ban-xay-dung-ki-nang-lanh-dao', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(348, 'https://www.brandsvietnam.com/upload/news/200px/2019/18439_Marketing.jpg', 'Làm thế nào để khiến cho khách hàng tiếp thị thay bạn?', '18439-Lam-the-nao-de-khien-cho-khach-hang-tiep-thi-thay-ban', 'https://www.brandsvietnam.com/18439-Lam-the-nao-de-khien-cho-khach-hang-tiep-thi-thay-ban', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(349, 'https://www.brandsvietnam.com/upload/news/200px/2019/18413_CEO.jpg', '5 cách xây dựng thương hiệu cá nhân đơn giản, hiệu quả cho CEO', '18413-5-cach-xay-dung-thuong-hieu-ca-nhan-don-gian-hieu-qua-cho-CEO', 'https://www.brandsvietnam.com/18413-5-cach-xay-dung-thuong-hieu-ca-nhan-don-gian-hieu-qua-cho-CEO', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(350, 'https://www.brandsvietnam.com/upload/news/200px/2019/18414_PersonalBrand.png', 'Thương hiệu cá nhân: Chìa khóa mở cửa thành công', '18414-Thuong-hieu-ca-nhan-Chia-khoa-mo-cua-thanh-cong', 'https://www.brandsvietnam.com/18414-Thuong-hieu-ca-nhan-Chia-khoa-mo-cua-thanh-cong', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(351, 'https://www.brandsvietnam.com/upload/news/200px/2019/18400_Customer.jpg', '5 sai lầm chết người trong dịch vụ khách hàng', '18400-5-sai-lam-chet-nguoi-trong-dich-vu-khach-hang', 'https://www.brandsvietnam.com/18400-5-sai-lam-chet-nguoi-trong-dich-vu-khach-hang', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(352, 'https://www.brandsvietnam.com/upload/news/200px/2019/18399_Ytuong.png', 'Có thêm ý tưởng phong phú với 3 cách đơn giản', '18399-Co-them-y-tuong-phong-phu-voi-3-cach-don-gian', 'https://www.brandsvietnam.com/18399-Co-them-y-tuong-phong-phu-voi-3-cach-don-gian', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(353, 'https://www.brandsvietnam.com/upload/news/200px/2019/18367_CEO.jpg', 'Bài học từ những sai lầm của các CEO', '18367-Bai-hoc-tu-nhung-sai-lam-cua-cac-CEO', 'https://www.brandsvietnam.com/18367-Bai-hoc-tu-nhung-sai-lam-cua-cac-CEO', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(354, 'https://www.brandsvietnam.com/upload/news/200px/2019/18266_eCommerce.jpg', 'Kinh doanh điện tử và thương mại điện tử', '18266-Kinh-doanh-dien-tu-va-thuong-mai-dien-tu', 'https://www.brandsvietnam.com/18266-Kinh-doanh-dien-tu-va-thuong-mai-dien-tu', ' div.reading-content', 0, '2019-10-02 08:55:38', '2019-10-02 08:55:38'),
(355, 'https://www.brandsvietnam.com/upload/news/200px/2019/18248_Leading.jpg', 'Thay đổi khi đang dẫn đầu cuộc chơi', '18248-Thay-doi-khi-dang-dan-dau-cuoc-choi', 'https://www.brandsvietnam.com/18248-Thay-doi-khi-dang-dan-dau-cuoc-choi', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(356, 'https://www.brandsvietnam.com/upload/news/200px/2019/18222_SteveJobs.jpg', 'Lý thuyết đơn giản của Steve Jobs về trách nhiệm của người lãnh đạo', '18222-Ly-thuyet-don-gian-cua-Steve-Jobs-ve-trach-nhiem-cua-nguoi-lanh-dao', 'https://www.brandsvietnam.com/18222-Ly-thuyet-don-gian-cua-Steve-Jobs-ve-trach-nhiem-cua-nguoi-lanh-dao', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(357, 'https://www.brandsvietnam.com/upload/news/200px/2019/18138_Salesperson.jpg', 'Người hướng nội có hợp với nghề sales?', '18138-Nguoi-huong-noi-co-hop-voi-nghe-sales', 'https://www.brandsvietnam.com/18138-Nguoi-huong-noi-co-hop-voi-nghe-sales', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(358, 'https://www.brandsvietnam.com/upload/news/200px/2019/18147_Khoinghiep.png', 'Công ty khởi nghiệp: Lớn mạnh nhưng cần giữ vững văn hóa', '18147-Cong-ty-khoi-nghiep-Lon-manh-nhung-can-giu-vung-van-hoa', 'https://www.brandsvietnam.com/18147-Cong-ty-khoi-nghiep-Lon-manh-nhung-can-giu-vung-van-hoa', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(359, 'https://www.brandsvietnam.com/upload/news/200px/2019/18095_CEO.jpg', 'Nhiệm kỳ chớp nhoáng của CEO', '18095-Nhiem-ky-chop-nhoang-cua-CEO', 'https://www.brandsvietnam.com/18095-Nhiem-ky-chop-nhoang-cua-CEO', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(360, 'https://www.brandsvietnam.com/upload/news/200px/2019/18085_Adtima.jpg', 'Gợi ý nơi làm việc đáng mơ ước cho sinh viên marketing 2019', '18085-Goi-y-noi-lam-viec-dang-mo-uoc-cho-sinh-vien-marketing-2019', 'https://www.brandsvietnam.com/18085-Goi-y-noi-lam-viec-dang-mo-uoc-cho-sinh-vien-marketing-2019', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(361, 'https://www.brandsvietnam.com/upload/news/200px/2019/17989_Manager.jpg', 'Kỹ năng quản trị trong bối cảnh đa văn hóa', '17989-Ky-nang-quan-tri-trong-boi-canh-da-van-hoa', 'https://www.brandsvietnam.com/17989-Ky-nang-quan-tri-trong-boi-canh-da-van-hoa', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(362, 'https://www.brandsvietnam.com/upload/news/200px/2019/18020_Book.jpg', '8 quyển sách dành cho sinh viên thiết kế', '18020-8-quyen-sach-danh-cho-sinh-vien-thiet-ke', 'https://www.brandsvietnam.com/18020-8-quyen-sach-danh-cho-sinh-vien-thiet-ke', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(363, 'https://www.brandsvietnam.com/upload/news/200px/2019/17994_Supermarket.jpg', 'Những yếu tố ảnh hưởng đến doanh thu khi doanh nghiệp chọn kênh phân phối siêu thị', '17994-Nhung-yeu-to-anh-huong-den-doanh-thu-khi-doanh-nghiep-chon-kenh-phan-phoi-sieu-thi', 'https://www.brandsvietnam.com/17994-Nhung-yeu-to-anh-huong-den-doanh-thu-khi-doanh-nghiep-chon-kenh-phan-phoi-sieu-thi', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(364, 'https://www.brandsvietnam.com/upload/news/200px/2019/18006_Quyetdinh.jpg', '3 mô hình ra quyết định', '18006-3-mo-hinh-ra-quyet-dinh', 'https://www.brandsvietnam.com/18006-3-mo-hinh-ra-quyet-dinh', ' div.reading-content', 1, '2019-10-02 08:55:39', '2020-04-30 20:50:58'),
(365, 'https://www.brandsvietnam.com/upload/news/200px/2019/17954_Book.jpg', 'Những bài học đắt giá đằng sau 8 cuốn sách kinh doanh hay nhất mọi thời đại', '17954-Nhung-bai-hoc-dat-gia-dang-sau-8-cuon-sach-kinh-doanh-hay-nhat-moi-thoi-dai', 'https://www.brandsvietnam.com/17954-Nhung-bai-hoc-dat-gia-dang-sau-8-cuon-sach-kinh-doanh-hay-nhat-moi-thoi-dai', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(366, 'https://www.brandsvietnam.com/upload/news/200px/2019/17960_Thuyetphuc.jpg', 'Nói trước đám đông không còn là “kỹ năng mềm”', '17960-Noi-truoc-dam-dong-khong-con-la-ky-nang-mem', 'https://www.brandsvietnam.com/17960-Noi-truoc-dam-dong-khong-con-la-ky-nang-mem', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(367, 'https://www.brandsvietnam.com/upload/news/200px/2019/17987_Adtima.jpg', 'Nếu bạn theo đuổi con đường trở thành Account, hãy thử một lần chơi lớn với Adtima Ignite', '17987-Neu-ban-theo-duoi-con-duong-tro-thanh-Account-hay-thu-mot-lan-choi-lon-voi-Adtima-Ignite', 'https://www.brandsvietnam.com/17987-Neu-ban-theo-duoi-con-duong-tro-thanh-Account-hay-thu-mot-lan-choi-lon-voi-Adtima-Ignite', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(368, 'https://www.brandsvietnam.com/upload/news/200px/2019/17980_Creative.jpg', 'Chỉ số sáng tạo quan trọng ra sao với doanh nghiệp?', '17980-Chi-so-sang-tao-quan-trong-ra-sao-voi-doanh-nghiep', 'https://www.brandsvietnam.com/17980-Chi-so-sang-tao-quan-trong-ra-sao-voi-doanh-nghiep', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(369, 'https://www.brandsvietnam.com/upload/news/200px/2019/17953_CMO.jpg', '3 bài học đơn giản mà giám đốc marketing cần có', '17953-3-bai-hoc-don-gian-ma-giam-doc-marketing-can-co', 'https://www.brandsvietnam.com/17953-3-bai-hoc-don-gian-ma-giam-doc-marketing-can-co', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(370, 'https://www.brandsvietnam.com/upload/news/200px/2019/17944_Kythuatso.jpg', 'Havard Business Review: 3 cách để trở lại hành trình kỹ thuật số', '17944-Havard-Business-Review-3-cach-de-tro-lai-hanh-trinh-ky-thuat-so', 'https://www.brandsvietnam.com/17944-Havard-Business-Review-3-cach-de-tro-lai-hanh-trinh-ky-thuat-so', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(371, 'https://www.brandsvietnam.com/upload/news/200px/2019/17902_restaurant-management-matrix-0.jpg', '4 yếu tố cần biết khi chuẩn bị mở Quán ăn - Nhà hàng', '17902-4-yeu-to-can-biet-khi-chuan-bi-mo-Quan-an-Nha-hang', 'https://www.brandsvietnam.com/17902-4-yeu-to-can-biet-khi-chuan-bi-mo-Quan-an-Nha-hang', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(372, 'https://www.brandsvietnam.com/upload/news/200px/2019/17923_Pareto.jpg', 'Nguyên tắc Pareto trong quản trị cung ứng', '17923-Nguyen-tac-Pareto-trong-quan-tri-cung-ung', 'https://www.brandsvietnam.com/17923-Nguyen-tac-Pareto-trong-quan-tri-cung-ung', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(373, 'https://www.brandsvietnam.com/upload/news/200px/2019/17880_Data.jpg', '4 lưu ý khi sử dụng dữ liệu trong marketing', '17880-4-luu-y-khi-su-dung-du-lieu-trong-marketing', 'https://www.brandsvietnam.com/17880-4-luu-y-khi-su-dung-du-lieu-trong-marketing', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(374, 'https://www.brandsvietnam.com/upload/news/200px/2019/17869_Franchise.jpg', '5 bước để nhượng quyền thương mại thành công', '17869-5-buoc-de-nhuong-quyen-thuong-mai-thanh-cong', 'https://www.brandsvietnam.com/17869-5-buoc-de-nhuong-quyen-thuong-mai-thanh-cong', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(375, 'https://www.brandsvietnam.com/upload/news/200px/2019/17850_DonaldTrump.png', 'Bài học kinh doanh từ nghệ thuật đàm phán của ông Donald Trump', '17850-Bai-hoc-kinh-doanh-tu-nghe-thuat-dam-phan-cua-ong-Donald-Trump', 'https://www.brandsvietnam.com/17850-Bai-hoc-kinh-doanh-tu-nghe-thuat-dam-phan-cua-ong-Donald-Trump', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(376, 'https://www.brandsvietnam.com/upload/news/200px/2019/17853_JohnPaulDeJoria.jpg', '3 yếu tố quyết định tiềm năng của sản phẩm mới', '17853-3-yeu-to-quyet-dinh-tiem-nang-cua-san-pham-moi', 'https://www.brandsvietnam.com/17853-3-yeu-to-quyet-dinh-tiem-nang-cua-san-pham-moi', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(377, 'https://www.brandsvietnam.com/upload/news/200px/2019/17827_TTConsultant_avatar.jpg', 'Những sai lầm \"giết chết\" fanpage Facebook của một doanh nghiệp', '17827-Nhung-sai-lam-giet-chet-fanpage-Facebook-cua-mot-doanh-nghiep', 'https://www.brandsvietnam.com/17827-Nhung-sai-lam-giet-chet-fanpage-Facebook-cua-mot-doanh-nghiep', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(378, 'https://www.brandsvietnam.com/upload/news/200px/2019/17818_ConsumerPower.png', 'Khai thác “quyền lực mới” để dẫn đầu', '17818-Khai-thac-quyen-luc-moi-de-dan-dau', 'https://www.brandsvietnam.com/17818-Khai-thac-quyen-luc-moi-de-dan-dau', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(379, 'https://www.brandsvietnam.com/upload/news/200px/2019/17787_Creative.jpg', 'Cách duy trì sáng tạo khi đang căng thẳng', '17787-Cach-duy-tri-sang-tao-khi-dang-cang-thang', 'https://www.brandsvietnam.com/17787-Cach-duy-tri-sang-tao-khi-dang-cang-thang', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(380, 'https://www.brandsvietnam.com/upload/news/200px/2019/17720_CocaCola.png', '“Cá nhân hóa” (Personalization) trong markerting', '17720-Ca-nhan-hoa-Personalization-trong-markerting', 'https://www.brandsvietnam.com/17720-Ca-nhan-hoa-Personalization-trong-markerting', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(381, 'https://www.brandsvietnam.com/upload/news/200px/2019/17735_Restaurant.jpg', '7 bài học quản lý từ các nhà hàng Michelin', '17735-7-bai-hoc-quan-ly-tu-cac-nha-hang-Michelin', 'https://www.brandsvietnam.com/17735-7-bai-hoc-quan-ly-tu-cac-nha-hang-Michelin', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(382, 'https://www.brandsvietnam.com/upload/news/200px/2019/17736_Franchise.jpg', 'Kinh doanh nhượng quyền: 23 câu hỏi cần đặt ra cho nhà nhượng quyền khi gặp mặt trực tiếp', '17736-Kinh-doanh-nhuong-quyen-23-cau-hoi-can-dat-ra-cho-nha-nhuong-quyen-khi-gap-mat-truc-tiep', 'https://www.brandsvietnam.com/17736-Kinh-doanh-nhuong-quyen-23-cau-hoi-can-dat-ra-cho-nha-nhuong-quyen-khi-gap-mat-truc-tiep', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(383, 'https://www.brandsvietnam.com/upload/news/200px/2019/17724_SoichiroHonda.jpg', 'Những triết lý làm nên sức mạnh của Honda', '17724-Nhung-triet-ly-lam-nen-suc-manh-cua-Honda', 'https://www.brandsvietnam.com/17724-Nhung-triet-ly-lam-nen-suc-manh-cua-Honda', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(384, 'https://www.brandsvietnam.com/upload/news/200px/2019/17711_Manager.png', 'Sử dụng hiệu quả các nguồn lực tiếp thị', '17711-Su-dung-hieu-qua-cac-nguon-luc-tiep-thi', 'https://www.brandsvietnam.com/17711-Su-dung-hieu-qua-cac-nguon-luc-tiep-thi', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(385, 'https://www.brandsvietnam.com/upload/news/200px/2019/17634_LarryEllison.jpg', '7 bài học kinh doanh thành công từ ông chủ Oracle', '17634-7-bai-hoc-kinh-doanh-thanh-cong-tu-ong-chu-Oracle', 'https://www.brandsvietnam.com/17634-7-bai-hoc-kinh-doanh-thanh-cong-tu-ong-chu-Oracle', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(386, 'https://www.brandsvietnam.com/upload/news/200px/2019/17628_SocialMedia.jpg', 'Những thước đo hiệu quả tiếp thị bằng truyền thông xã hội', '17628-Nhung-thuoc-do-hieu-qua-tiep-thi-bang-truyen-thong-xa-hoi', 'https://www.brandsvietnam.com/17628-Nhung-thuoc-do-hieu-qua-tiep-thi-bang-truyen-thong-xa-hoi', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(387, 'https://www.brandsvietnam.com/upload/news/200px/2019/17601_OprahWinfrey.jpg', '3 bài học kinh doanh từ \"nữ hoàng truyền thông\" Oprah Winfrey', '17601-3-bai-hoc-kinh-doanh-tu-nu-hoang-truyen-thong-Oprah-Winfrey', 'https://www.brandsvietnam.com/17601-3-bai-hoc-kinh-doanh-tu-nu-hoang-truyen-thong-Oprah-Winfrey', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(388, 'https://www.brandsvietnam.com/upload/news/200px/2019/17590_Presentation.jpg', 'Kỹ năng thuyết trình: Càng đơn giản, càng thuyết phục', '17590-Ky-nang-thuyet-trinh-Cang-don-gian-cang-thuyet-phuc', 'https://www.brandsvietnam.com/17590-Ky-nang-thuyet-trinh-Cang-don-gian-cang-thuyet-phuc', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(389, 'https://www.brandsvietnam.com/upload/news/200px/2019/17600_Marketer.jpg', '8 quy tắc cơ bản các marketer phải tuân theo', '17600-8-quy-tac-co-ban-cac-marketer-phai-tuan-theo', 'https://www.brandsvietnam.com/17600-8-quy-tac-co-ban-cac-marketer-phai-tuan-theo', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(390, 'https://www.brandsvietnam.com/upload/news/200px/2019/17586_Storytelling.jpg', 'Nghệ thuật kể chuyện bằng tên thương hiệu', '17586-Nghe-thuat-ke-chuyen-bang-ten-thuong-hieu', 'https://www.brandsvietnam.com/17586-Nghe-thuat-ke-chuyen-bang-ten-thuong-hieu', ' div.reading-content', 1, '2019-10-02 08:55:39', '2020-03-03 16:09:05'),
(391, 'https://www.brandsvietnam.com/upload/news/200px/2019/17511_2.jpg', '5 bí mật thú vị về khả năng lãnh đạo', '17511-5-bi-mat-thu-vi-ve-kha-nang-lanh-dao', 'https://www.brandsvietnam.com/17511-5-bi-mat-thu-vi-ve-kha-nang-lanh-dao', ' div.reading-content', 0, '2019-10-02 08:55:39', '2019-10-02 08:55:39'),
(392, 'https://www.brandsvietnam.com/upload/news/200px/2019/17528_sangtao1.jpg', '5 câu hỏi giết chết khả năng sáng tạo của bạn', '17528-5-cau-hoi-giet-chet-kha-nang-sang-tao-cua-ban', 'https://www.brandsvietnam.com/17528-5-cau-hoi-giet-chet-kha-nang-sang-tao-cua-ban', ' div.reading-content', 4, '2019-10-02 08:55:40', '2020-03-03 16:28:43');
INSERT INTO `news` (`id`, `image`, `title`, `slug`, `content`, `post_by`, `view`, `created_at`, `updated_at`) VALUES
(393, 'https://www.brandsvietnam.com/upload/news/200px/2019/17545_Pipelines.jpeg', 'Chuỗi giá trị, Hệ sinh thái và các quy luật mới về Chiến lược Kinh doanh (Phần 2)', 'tieudiem', 'https://www.brandsvietnam.com/tieudiem/17545-Chuoi-gia-tri-He-sinh-thai-va-cac-quy-luat-moi-ve-Chien-luoc-Kinh-doanh-Phan-2', ' div.reading-content', 1, '2019-10-02 08:55:40', '2020-03-03 16:05:42'),
(394, 'https://www.brandsvietnam.com/upload/news/200px/2019/17461_Salesteam.jpg', '7 tiêu chí để trở thành đội ngũ bán hàng xuất sắc', '17461-7-tieu-chi-de-tro-thanh-doi-ngu-ban-hang-xuat-sac', 'https://www.brandsvietnam.com/17461-7-tieu-chi-de-tro-thanh-doi-ngu-ban-hang-xuat-sac', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(395, 'https://www.brandsvietnam.com/upload/news/200px/2019/17455_CEO.jpg', '3 nhóm đối tượng CEO cần giao tiếp hiệu quả để thành công', '17455-3-nhom-doi-tuong-CEO-can-giao-tiep-hieu-qua-de-thanh-cong', 'https://www.brandsvietnam.com/17455-3-nhom-doi-tuong-CEO-can-giao-tiep-hieu-qua-de-thanh-cong', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(396, 'https://www.brandsvietnam.com/upload/news/200px/2019/17456_DVKhachhang.jpg', '2 quyết định quan trọng mang lại sự hài lòng cho khách hàng', '17456-2-quyet-dinh-quan-trong-mang-lai-su-hai-long-cho-khach-hang', 'https://www.brandsvietnam.com/17456-2-quyet-dinh-quan-trong-mang-lai-su-hai-long-cho-khach-hang', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(397, 'https://www.brandsvietnam.com/upload/news/200px/2018/17373_Bookaholic7.png', 'Bookaholic #7: “90-20-30” - 90 Bài học vỡ lòng về ý tưởng và câu chữ', 'tieudiem', 'https://www.brandsvietnam.com/tieudiem/17373-Bookaholic-7-902030-90-Bai-hoc-vo-long-ve-y-tuong-va-cau-chu', ' div.reading-content', 1, '2019-10-02 08:55:40', '2020-03-03 16:05:42'),
(398, 'https://www.brandsvietnam.com/upload/news/200px/2018/17368_InboundMarketing.jpg', 'Inbound Marketing dùng sao cho đúng?', '17368-Inbound-Marketing-dung-sao-cho-dung', 'https://www.brandsvietnam.com/17368-Inbound-Marketing-dung-sao-cho-dung', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(399, 'https://www.brandsvietnam.com/upload/news/200px/2018/17379_Lanhdao.jpg', 'Chuyển đổi vai trò của nhà quản lý để phát triển doanh nghiệp', '17379-Chuyen-doi-vai-tro-cua-nha-quan-ly-de-phat-trien-doanh-nghiep', 'https://www.brandsvietnam.com/17379-Chuyen-doi-vai-tro-cua-nha-quan-ly-de-phat-trien-doanh-nghiep', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(400, 'https://www.brandsvietnam.com/upload/news/200px/2018/17370_ProductTest.png', 'Sản phẩm mới doanh nghiệp tự thử nghiệm được không?', '17370-San-pham-moi-doanh-nghiep-tu-thu-nghiem-duoc-khong', 'https://www.brandsvietnam.com/17370-San-pham-moi-doanh-nghiep-tu-thu-nghiem-duoc-khong', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(401, 'https://www.brandsvietnam.com/upload/news/200px/2018/17348_Content.jpg', 'Nội dung – trái tim của tiếp thị số', '17348-Noi-dung-trai-tim-cua-tiep-thi-so', 'https://www.brandsvietnam.com/17348-Noi-dung-trai-tim-cua-tiep-thi-so', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(402, 'https://www.brandsvietnam.com/upload/news/200px/2018/17267_Banhang.jpg', 'Làm sao để bán hàng cho Tổng thống?', '17267-Lam-sao-de-ban-hang-cho-Tong-thong', 'https://www.brandsvietnam.com/17267-Lam-sao-de-ban-hang-cho-Tong-thong', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(403, 'https://www.brandsvietnam.com/upload/news/200px/2018/17290_Leader.jpg', 'Câu chuyện bất ngờ về thuật lãnh đạo', '17290-Cau-chuyen-bat-ngo-ve-thuat-lanh-dao', 'https://www.brandsvietnam.com/17290-Cau-chuyen-bat-ngo-ve-thuat-lanh-dao', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(404, 'https://www.brandsvietnam.com/upload/news/200px/2018/17275_Sales.jpg', 'Nhiệm vụ nghề sales: Tìm ra nhu cầu của khách hàng', '17275-Nhiem-vu-nghe-sales-Tim-ra-nhu-cau-cua-khach-hang', 'https://www.brandsvietnam.com/17275-Nhiem-vu-nghe-sales-Tim-ra-nhu-cau-cua-khach-hang', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(405, 'https://www.brandsvietnam.com/upload/news/200px/2018/17251_Salesperson.jpg', 'Vượt qua nỗi sợ bán hàng', '17251-Vuot-qua-noi-so-ban-hang', 'https://www.brandsvietnam.com/17251-Vuot-qua-noi-so-ban-hang', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(406, 'https://www.brandsvietnam.com/upload/news/200px/2018/17210_CEO.jpg', '3 kiểu tư duy cần có của CEO', '17210-3-kieu-tu-duy-can-co-cua-CEO', 'https://www.brandsvietnam.com/17210-3-kieu-tu-duy-can-co-cua-CEO', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(407, 'https://www.brandsvietnam.com/upload/news/200px/2018/17232_Statista.jpg', '18 nguồn miễn phí để tự nghiên cứu đối thủ / thị trường', '17232-18-nguon-mien-phi-de-tu-nghien-cuu-doi-thu-thi-truong', 'https://www.brandsvietnam.com/17232-18-nguon-mien-phi-de-tu-nghien-cuu-doi-thu-thi-truong', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(408, 'https://www.brandsvietnam.com/upload/news/200px/2018/17208_Smile.jpg', 'Tiếp thị bằng nụ cười: Hiểu đúng để ứng dụng hiệu quả', '17208-Tiep-thi-bang-nu-cuoi-Hieu-dung-de-ung-dung-hieu-qua', 'https://www.brandsvietnam.com/17208-Tiep-thi-bang-nu-cuoi-Hieu-dung-de-ung-dung-hieu-qua', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(409, 'https://www.brandsvietnam.com/upload/news/200px/2018/17121_Content.jpeg', '3 câu hỏi cho chiến lược tiếp thị nội dung', '17121-3-cau-hoi-cho-chien-luoc-tiep-thi-noi-dung', 'https://www.brandsvietnam.com/17121-3-cau-hoi-cho-chien-luoc-tiep-thi-noi-dung', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(410, 'https://www.brandsvietnam.com/upload/news/200px/2018/17130_GenYZ.png', 'Xây dựng mối quan hệ khách hàng Gen Y & Z với CRM và dữ liệu', '17130-Xay-dung-moi-quan-he-khach-hang-Gen-Y-Z-voi-CRM-va-du-lieu', 'https://www.brandsvietnam.com/17130-Xay-dung-moi-quan-he-khach-hang-Gen-Y-Z-voi-CRM-va-du-lieu', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(411, 'https://www.brandsvietnam.com/upload/news/200px/2018/17095_YoungMarketers.jpeg', 'Chung kết cuộc thi Young Marketers 7: Khi ‘Gen Z’ lội ngược dòng văn hóa để cứu tuồng (hát bội)', 'tieudiem', 'https://www.brandsvietnam.com/tieudiem/17095-Chung-ket-cuoc-thi-Young-Marketers-7-Khi-Gen-Z-loi-nguoc-dong-van-hoa-de-cuu-tuong-hat-boi', ' div.reading-content', 1, '2019-10-02 08:55:40', '2020-03-03 16:05:42'),
(412, 'https://www.brandsvietnam.com/upload/news/200px/2018/17081_Bookaholic6.png', 'Bookaholic #6: HBR On Strategic Marketing - Marketing Chiến lược', 'tieudiem', 'https://www.brandsvietnam.com/tieudiem/17081-Bookaholic-6-HBR-On-Strategic-Marketing-Marketing-Chien-luoc', ' div.reading-content', 1, '2019-10-02 08:55:40', '2020-03-03 16:05:42'),
(413, 'https://www.brandsvietnam.com/upload/news/200px/2018/17067_Sales.jpg', 'Kỹ năng bán hàng: Đừng bỏ qua cuộc gặp “mặt đối mặt, tay bắt tay”', '17067-Ky-nang-ban-hang-Dung-bo-qua-cuoc-gap-mat-doi-mat-tay-bat-tay', 'https://www.brandsvietnam.com/17067-Ky-nang-ban-hang-Dung-bo-qua-cuoc-gap-mat-doi-mat-tay-bat-tay', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(414, 'https://www.brandsvietnam.com/upload/news/200px/2018/17030_Leader.jpg', '4 kỹ năng ra quyết định quan trọng cần có trong công việc', '17030-4-ky-nang-ra-quyet-dinh-quan-trong-can-co-trong-cong-viec', 'https://www.brandsvietnam.com/17030-4-ky-nang-ra-quyet-dinh-quan-trong-can-co-trong-cong-viec', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(415, 'https://www.brandsvietnam.com/upload/news/200px/2018/16992_Military.jpg', '7 nguyên tắc quân sự có thể áp dụng vào chiến lược marketing', '16992-7-nguyen-tac-quan-su-co-the-ap-dung-vao-chien-luoc-marketing', 'https://www.brandsvietnam.com/16992-7-nguyen-tac-quan-su-co-the-ap-dung-vao-chien-luoc-marketing', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(416, 'https://www.brandsvietnam.com/upload/news/200px/2018/16983_Startup.jpg', 'Công ty startup và bốn sai lầm lớn trong điều hành', '16983-Cong-ty-startup-va-bon-sai-lam-lon-trong-dieu-hanh', 'https://www.brandsvietnam.com/16983-Cong-ty-startup-va-bon-sai-lam-lon-trong-dieu-hanh', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(417, 'https://www.brandsvietnam.com/upload/news/200px/2018/16945_MarketingPlan.jpg', '3 câu hỏi kinh điển của người làm marketing', '16945-3-cau-hoi-kinh-dien-cua-nguoi-lam-marketing', 'https://www.brandsvietnam.com/16945-3-cau-hoi-kinh-dien-cua-nguoi-lam-marketing', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(418, 'https://www.brandsvietnam.com/upload/news/200px/2018/16842_PiyushGupta.jpg', '5 chữ \"I\" của một nhà lãnh đạo xuất sắc', '16842-5-chu-I-cua-mot-nha-lanh-dao-xuat-sac', 'https://www.brandsvietnam.com/16842-5-chu-I-cua-mot-nha-lanh-dao-xuat-sac', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(419, 'https://www.brandsvietnam.com/upload/news/200px/2018/16836_BusinessRelationship.jpg', 'Thành công nhờ xây dựng mối quan hệ hiệu quả', '16836-Thanh-cong-nho-xay-dung-moi-quan-he-hieu-qua', 'https://www.brandsvietnam.com/16836-Thanh-cong-nho-xay-dung-moi-quan-he-hieu-qua', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(420, 'https://www.brandsvietnam.com/upload/news/200px/2018/16831_Content.jpg', 'Thêm gia vị cho nội dung tiếp thị', '16831-Them-gia-vi-cho-noi-dung-tiep-thi', 'https://www.brandsvietnam.com/16831-Them-gia-vi-cho-noi-dung-tiep-thi', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(421, 'https://www.brandsvietnam.com/upload/news/200px/2018/16814_CEOChallange.jpg', 'Cuộc thi P&G CEO Challenge 2018 - Cơ hội để người trẻ học cách tư duy như một CEO', '16814-Cuoc-thi-PG-CEO-Challenge-2018-Co-hoi-de-nguoi-tre-hoc-cach-tu-duy-nhu-mot-CEO', 'https://www.brandsvietnam.com/16814-Cuoc-thi-PG-CEO-Challenge-2018-Co-hoi-de-nguoi-tre-hoc-cach-tu-duy-nhu-mot-CEO', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(422, 'https://www.brandsvietnam.com/upload/news/200px/2018/16805_Branding.jpg', 'Thương hiệu và ảnh hưởng từ quốc gia xuất xứ', '16805-Thuong-hieu-va-anh-huong-tu-quoc-gia-xuat-xu', 'https://www.brandsvietnam.com/16805-Thuong-hieu-va-anh-huong-tu-quoc-gia-xuat-xu', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(423, 'https://www.brandsvietnam.com/upload/news/200px/2018/16769_Innovative.jpg', 'Cách các công ty trên thế giới đổi mới sáng tạo', '16769-Cach-cac-cong-ty-tren-the-gioi-doi-moi-sang-tao', 'https://www.brandsvietnam.com/16769-Cach-cac-cong-ty-tren-the-gioi-doi-moi-sang-tao', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(424, 'https://www.brandsvietnam.com/upload/news/200px/2018/16734_16734JeffBezos.jpg', '3 lời khuyên về việc lắng nghe lời phê bình của tỷ phú Jeff Bezos', '16734-3-loi-khuyen-ve-viec-lang-nghe-loi-phe-binh-cua-ty-phu-Jeff-Bezos', 'https://www.brandsvietnam.com/16734-3-loi-khuyen-ve-viec-lang-nghe-loi-phe-binh-cua-ty-phu-Jeff-Bezos', ' div.reading-content', 0, '2019-10-02 08:55:40', '2019-10-02 08:55:40'),
(425, 'https://www.brandsvietnam.com/upload/news/200px/2018/16737_CustomerExperience.jpg', 'Trải nghiệm của khách hàng trong quá trình sáp nhập công ty', '16737-Trai-nghiem-cua-khach-hang-trong-qua-trinh-sap-nhap-cong-ty', 'https://www.brandsvietnam.com/16737-Trai-nghiem-cua-khach-hang-trong-qua-trinh-sap-nhap-cong-ty', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(426, 'https://www.brandsvietnam.com/upload/news/200px/2018/16736_Target.jpg', 'Quản trị bằng mục tiêu', '16736-Quan-tri-bang-muc-tieu', 'https://www.brandsvietnam.com/16736-Quan-tri-bang-muc-tieu', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(427, 'https://www.brandsvietnam.com/upload/news/200px/2018/16692_AzrielRatz.jpg', '4 bài học lội ngược dòng từ một CEO', '16692-4-bai-hoc-loi-nguoc-dong-tu-mot-CEO', 'https://www.brandsvietnam.com/16692-4-bai-hoc-loi-nguoc-dong-tu-mot-CEO', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(428, 'https://www.brandsvietnam.com/upload/news/200px/2018/16697_Logos.jpg', 'Logo cũng có ảnh hưởng tới quyết định mua hàng', '16697-Logo-cung-co-anh-huong-toi-quyet-dinh-mua-hang', 'https://www.brandsvietnam.com/16697-Logo-cung-co-anh-huong-toi-quyet-dinh-mua-hang', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(429, 'https://www.brandsvietnam.com/upload/news/200px/2018/16706_PhamHongHai.jpg', 'CEO HSBC Việt Nam chia sẻ những thất bại trên giảng đường', '16706-CEO-HSBC-Viet-Nam-chia-se-nhung-that-bai-tren-giang-duong', 'https://www.brandsvietnam.com/16706-CEO-HSBC-Viet-Nam-chia-se-nhung-that-bai-tren-giang-duong', ' div.reading-content', 3, '2019-10-02 08:55:41', '2020-03-03 15:55:08'),
(430, 'https://www.brandsvietnam.com/upload/news/200px/2018/16690_InternetofThings.jpg', '3 lưu ý cho doanh nghiệp Việt muốn tiếp cận Internet vạn vật', '16690-3-luu-y-cho-doanh-nghiep-Viet-muon-tiep-can-Internet-van-vat', 'https://www.brandsvietnam.com/16690-3-luu-y-cho-doanh-nghiep-Viet-muon-tiep-can-Internet-van-vat', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(431, 'https://www.brandsvietnam.com/upload/news/200px/2018/16645_Branding.png', 'Các cấp độ làm thương hiệu', '16645-Cac-cap-do-lam-thuong-hieu', 'https://www.brandsvietnam.com/16645-Cac-cap-do-lam-thuong-hieu', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(432, 'https://www.brandsvietnam.com/upload/news/200px/2018/16667_Manager.jpg', '3 bẫy nhận thức khiến nhà lãnh đạo ra quyết định sai trong thời đại dữ liệu', '16667-3-bay-nhan-thuc-khien-nha-lanh-dao-ra-quyet-dinh-sai-trong-thoi-dai-du-lieu', 'https://www.brandsvietnam.com/16667-3-bay-nhan-thuc-khien-nha-lanh-dao-ra-quyet-dinh-sai-trong-thoi-dai-du-lieu', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(433, 'https://www.brandsvietnam.com/upload/news/200px/2018/16686_CocaCola.jpg', 'Thu hút khách hàng bằng tâm lý sở hữu', '16686-Thu-hut-khach-hang-bang-tam-ly-so-huu', 'https://www.brandsvietnam.com/16686-Thu-hut-khach-hang-bang-tam-ly-so-huu', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(434, 'https://www.brandsvietnam.com/upload/news/200px/2018/16681_YoungMarketers.png', 'Công bố Đề thi Vòng loại Young Marketers 7', 'tieudiem', 'https://www.brandsvietnam.com/tieudiem/16681-Cong-bo-De-thi-Vong-loai-Young-Marketers-7', ' div.reading-content', 1, '2019-10-02 08:55:41', '2020-03-03 16:05:42'),
(435, 'https://www.brandsvietnam.com/upload/news/200px/2018/16677_Video.jpg', '6 cách giúp thương hiệu tỏa sáng với các chiến lược video marketing', '16677-6-cach-giup-thuong-hieu-toa-sang-voi-cac-chien-luoc-video-marketing', 'https://www.brandsvietnam.com/16677-6-cach-giup-thuong-hieu-toa-sang-voi-cac-chien-luoc-video-marketing', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(436, 'https://www.brandsvietnam.com/upload/news/200px/2018/16666_Investor.jpg', 'Nhà đầu tư nhìn vào những yếu tố nào để quyết định rót vốn cho một ý tưởng khởi nghiệp?', '16666-Nha-dau-tu-nhin-vao-nhung-yeu-to-nao-de-quyet-dinh-rot-von-cho-mot-y-tuong-khoi-nghiep', 'https://www.brandsvietnam.com/16666-Nha-dau-tu-nhin-vao-nhung-yeu-to-nao-de-quyet-dinh-rot-von-cho-mot-y-tuong-khoi-nghiep', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(437, 'https://www.brandsvietnam.com/upload/news/200px/2018/16644_Shopper.jpg', 'Trải nghiệm khách hàng', '16644-Trai-nghiem-khach-hang', 'https://www.brandsvietnam.com/16644-Trai-nghiem-khach-hang', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(438, 'https://www.brandsvietnam.com/upload/news/200px/2018/16643_AmbushMarketing.jpg', 'Tổng quan về Tiếp thị phục kích (Ambush Marketing)', '16643-Tong-quan-ve-Tiep-thi-phuc-kich-Ambush-Marketing', 'https://www.brandsvietnam.com/16643-Tong-quan-ve-Tiep-thi-phuc-kich-Ambush-Marketing', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(439, 'https://www.brandsvietnam.com/upload/news/200px/2018/16587_SteveJobs.jpg', '12 bài học từ Steve Jobs dành cho doanh nhân khởi nghiệp', '16587-12-bai-hoc-tu-Steve-Jobs-danh-cho-doanh-nhan-khoi-nghiep', 'https://www.brandsvietnam.com/16587-12-bai-hoc-tu-Steve-Jobs-danh-cho-doanh-nhan-khoi-nghiep', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(440, 'https://www.brandsvietnam.com/upload/news/200px/2018/16616_YoungMarketers7.jpg', 'Công bố danh sách 18 thành viên Ban giám khảo và Giảng viên Young Marketers 7', '16616-Cong-bo-danh-sach-18-thanh-vien-Ban-giam-khao-va-Giang-vien-Young-Marketers-7', 'https://www.brandsvietnam.com/16616-Cong-bo-danh-sach-18-thanh-vien-Ban-giam-khao-va-Giang-vien-Young-Marketers-7', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(441, 'https://www.brandsvietnam.com/upload/news/200px/2018/16615_RichardBranson.JPG', 'Tư duy linh hoạt - bài học từ các CEO thành công', '16615-Tu-duy-linh-hoat-bai-hoc-tu-cac-CEO-thanh-cong', 'https://www.brandsvietnam.com/16615-Tu-duy-linh-hoat-bai-hoc-tu-cac-CEO-thanh-cong', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(442, 'https://www.brandsvietnam.com/upload/news/200px/2018/16514_JeffBezos.jpg', 'Thúc đẩy sáng tạo theo cách của Jeff Bezos', '16514-Thuc-day-sang-tao-theo-cach-cua-Jeff-Bezos', 'https://www.brandsvietnam.com/16514-Thuc-day-sang-tao-theo-cach-cua-Jeff-Bezos', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(443, 'https://www.brandsvietnam.com/upload/news/200px/2018/16582_Combo.jpg', 'Nghệ thuật bán hàng theo gói', '16582-Nghe-thuat-ban-hang-theo-goi', 'https://www.brandsvietnam.com/16582-Nghe-thuat-ban-hang-theo-goi', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(444, 'https://www.brandsvietnam.com/upload/news/200px/2018/16573_TadashiYanai.jpg', '7 \"nguyên tắc vàng\" trong kinh doanh của tỷ phú Tadashi Yanai', '16573-7-nguyen-tac-vang-trong-kinh-doanh-cua-ty-phu-Tadashi-Yanai', 'https://www.brandsvietnam.com/16573-7-nguyen-tac-vang-trong-kinh-doanh-cua-ty-phu-Tadashi-Yanai', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(445, 'https://www.brandsvietnam.com/upload/news/200px/2018/16542_BillGatesWarrenBuffett.jpg', '4 điều Bill Gates học được từ Warren Buffett suốt 25 năm', '16542-4-dieu-Bill-Gates-hoc-duoc-tu-Warren-Buffett-suot-25-nam', 'https://www.brandsvietnam.com/16542-4-dieu-Bill-Gates-hoc-duoc-tu-Warren-Buffett-suot-25-nam', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(446, 'https://www.brandsvietnam.com/upload/news/200px/2018/16558_YoungMarketers.png', 'Công bố thể lệ cuộc thi Young Marketers 7', 'tieudiem', 'https://www.brandsvietnam.com/tieudiem/16558-Cong-bo-the-le-cuoc-thi-Young-Marketers-7', ' div.reading-content', 1, '2019-10-02 08:55:41', '2020-03-03 16:05:42'),
(447, 'https://www.brandsvietnam.com/upload/news/200px/2018/16543_KitKat.jpg', 'Bài học xây dựng thương hiệu từ KitKat Nhật Bản', '16543-Bai-hoc-xay-dung-thuong-hieu-tu-KitKat-Nhat-Ban', 'https://www.brandsvietnam.com/16543-Bai-hoc-xay-dung-thuong-hieu-tu-KitKat-Nhat-Ban', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(448, 'https://www.brandsvietnam.com/upload/news/200px/2019/19261_7.jpg', 'Vì sao startup đình đám Uber và WeWork đốt hàng chục tỷ USD?', '19261-Vi-sao-startup-dinh-dam-Uber-va-WeWork-dot-hang-chuc-ty-USD', 'https://www.brandsvietnam.com/19261-Vi-sao-startup-dinh-dam-Uber-va-WeWork-dot-hang-chuc-ty-USD', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(449, 'https://www.brandsvietnam.com/upload/news/200px/2019/19264_10.jpg', 'Hơn 70% thị phần trong tay Grab, cơ hội nào cho Go-Viet và Be?', '19264-Hon-70-thi-phan-trong-tay-Grab-co-hoi-nao-cho-GoViet-va-Be', 'https://www.brandsvietnam.com/19264-Hon-70-thi-phan-trong-tay-Grab-co-hoi-nao-cho-GoViet-va-Be', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(450, 'https://www.brandsvietnam.com/upload/news/200px/2019/19258_13.png', 'Vì sao Netflix từ chối đề nghị mua lại của ông chủ Amazon 20 năm trước?', '19258-Vi-sao-Netflix-tu-choi-de-nghi-mua-lai-cua-ong-chu-Amazon-20-nam-truoc', 'https://www.brandsvietnam.com/19258-Vi-sao-Netflix-tu-choi-de-nghi-mua-lai-cua-ong-chu-Amazon-20-nam-truoc', ' div.reading-content', 1, '2019-10-02 08:55:41', '2020-05-05 18:02:24'),
(451, 'https://www.brandsvietnam.com/upload/news/200px/2019/19246_8.jpg', 'Bán lẻ: Trải nghiệm khách hàng là chìa khóa', '19246-Ban-le-Trai-nghiem-khach-hang-la-chia-khoa', 'https://www.brandsvietnam.com/19246-Ban-le-Trai-nghiem-khach-hang-la-chia-khoa', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(452, 'https://www.brandsvietnam.com/upload/news/200px/2019/19235_3.jpg', 'Phát triển startup tỉ đô la từ nền tảng thương mại điện tử', '19235-Phat-trien-startup-ti-do-la-tu-nen-tang-thuong-mai-dien-tu', 'https://www.brandsvietnam.com/19235-Phat-trien-startup-ti-do-la-tu-nen-tang-thuong-mai-dien-tu', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(453, 'https://www.brandsvietnam.com/upload/news/200px/2019/19214_23.jpg', 'Triết lý “quản trị bằng yêu thương” của ông chủ Thế Giới Di Động Nguyễn Đức Tài', '19214-Triet-ly-quan-tri-bang-yeu-thuong-cua-ong-chu-The-Gioi-Di-Dong-Nguyen-Duc-Tai', 'https://www.brandsvietnam.com/19214-Triet-ly-quan-tri-bang-yeu-thuong-cua-ong-chu-The-Gioi-Di-Dong-Nguyen-Duc-Tai', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(454, 'https://www.brandsvietnam.com/upload/news/200px/2019/19227_13.jpg', 'Chuyên gia “hiến kế” cho ngành ô tô Việt', '19227-Chuyen-gia-hien-ke-cho-nganh-o-to-Viet', 'https://www.brandsvietnam.com/19227-Chuyen-gia-hien-ke-cho-nganh-o-to-Viet', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(455, 'https://www.brandsvietnam.com/upload/news/200px/2019/19238_12.jpg', 'Quản lý thương mại điện tử xuyên biên giới: Hãy học kinh nghiệm từ quốc tế', '19238-Quan-ly-thuong-mai-dien-tu-xuyen-bien-gioi-Hay-hoc-kinh-nghiem-tu-quoc-te', 'https://www.brandsvietnam.com/19238-Quan-ly-thuong-mai-dien-tu-xuyen-bien-gioi-Hay-hoc-kinh-nghiem-tu-quoc-te', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(456, 'https://www.brandsvietnam.com/upload/news/200px/2019/19236_15.jpg', 'Để thương mại điện tử Việt trở nên hấp dẫn với \"người khổng lồ\"', '19236-De-thuong-mai-dien-tu-Viet-tro-nen-hap-dan-voi-nguoi-khong-lo', 'https://www.brandsvietnam.com/19236-De-thuong-mai-dien-tu-Viet-tro-nen-hap-dan-voi-nguoi-khong-lo', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(457, 'https://www.brandsvietnam.com/upload/news/200px/2019/19226_14.jpg', 'Federer gây dựng khối tài sản nửa tỷ USD thế nào?', '19226-Federer-gay-dung-khoi-tai-san-nua-ty-USD-the-nao', 'https://www.brandsvietnam.com/19226-Federer-gay-dung-khoi-tai-san-nua-ty-USD-the-nao', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(458, 'https://www.brandsvietnam.com/upload/news/200px/2019/19215_20.jpg', 'Tỷ phú Phạm Nhật Vượng chấp nhận khó khăn, dồn lực cho “đứa con” Vinfast', '19215-Ty-phu-Pham-Nhat-Vuong-chap-nhan-kho-khan-don-luc-cho-dua-con-Vinfast', 'https://www.brandsvietnam.com/19215-Ty-phu-Pham-Nhat-Vuong-chap-nhan-kho-khan-don-luc-cho-dua-con-Vinfast', ' div.reading-content', 0, '2019-10-02 08:55:41', '2019-10-02 08:55:41'),
(459, 'https://www.brandsvietnam.com/upload/news/200px/2019/19220_90.jpeg', 'Facebook, Google, Amazon... đã chứng minh cho cả thế giới thấy dầu mỏ không còn là tài nguyên số 1', '19220-Facebook-Google-Amazon-da-chung-minh-cho-ca-the-gioi-thay-dau-mo-khong-con-la-tai-nguyen-so-1', 'https://www.brandsvietnam.com/19220-Facebook-Google-Amazon-da-chung-minh-cho-ca-the-gioi-thay-dau-mo-khong-con-la-tai-nguyen-so-1', ' div.reading-content', 1, '2019-10-02 08:55:42', '2020-03-20 12:20:50'),
(460, 'https://www.brandsvietnam.com/upload/news/200px/2019/19219_15.png', 'Giải mã câu chuyện thành công của Starbucks, Slack, Pinterest', '19219-Giai-ma-cau-chuyen-thanh-cong-cua-Starbucks-Slack-Pinterest', 'https://www.brandsvietnam.com/19219-Giai-ma-cau-chuyen-thanh-cong-cua-Starbucks-Slack-Pinterest', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(461, 'https://www.brandsvietnam.com/upload/news/200px/2019/19143_8.jpg', '\"Tinh thần khởi nghiệp ở Việt Nam luôn mạnh mẽ và đầy cảm hứng”', '19143-Tinh-than-khoi-nghiep-o-Viet-Nam-luon-manh-me-va-day-cam-hung', 'https://www.brandsvietnam.com/19143-Tinh-than-khoi-nghiep-o-Viet-Nam-luon-manh-me-va-day-cam-hung', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(462, 'https://www.brandsvietnam.com/upload/news/200px/2019/19139_2.jpg', 'Startup triệu \"đô\" của Shark Tank tham vọng thành công ty công nghệ hàng đầu về F&B', '19139-Startup-trieu-do-cua-Shark-Tank-tham-vong-thanh-cong-ty-cong-nghe-hang-dau-ve-FB', 'https://www.brandsvietnam.com/19139-Startup-trieu-do-cua-Shark-Tank-tham-vong-thanh-cong-ty-cong-nghe-hang-dau-ve-FB', ' div.reading-content', 1, '2019-10-02 08:55:42', '2020-03-23 20:07:28'),
(463, 'https://www.brandsvietnam.com/upload/news/200px/2019/Ava_1_1568735734.jpg', 'Đề xuất quảng cáo rượu, bia phải có cảnh báo tác hại', '19199-De-xuat-quang-cao-ruou-bia-phai-co-canh-bao-tac-hai', 'https://www.brandsvietnam.com/19199-De-xuat-quang-cao-ruou-bia-phai-co-canh-bao-tac-hai', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(464, 'https://www.brandsvietnam.com/upload/news/200px/2019/19144_9.jpg', 'Kinh tế chia sẻ, phép thử đối với tư duy quản lý', '19144-Kinh-te-chia-se-phep-thu-doi-voi-tu-duy-quan-ly', 'https://www.brandsvietnam.com/19144-Kinh-te-chia-se-phep-thu-doi-voi-tu-duy-quan-ly', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(465, 'https://www.brandsvietnam.com/upload/news/200px/2019/19180_10.jpg', 'Ra sức thâu tóm, cuộc đua chiếm lĩnh thị phần bán lẻ sắp có hồi kết?', '19180-Ra-suc-thau-tom-cuoc-dua-chiem-linh-thi-phan-ban-le-sap-co-hoi-ket', 'https://www.brandsvietnam.com/19180-Ra-suc-thau-tom-cuoc-dua-chiem-linh-thi-phan-ban-le-sap-co-hoi-ket', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(466, 'https://www.brandsvietnam.com/upload/news/200px/2019/19182_5.jpeg', 'Quyền năng ABCD', '19182-Quyen-nang-ABCD', 'https://www.brandsvietnam.com/19182-Quyen-nang-ABCD', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(467, 'https://www.brandsvietnam.com/upload/news/200px/2019/19154_13.JPG', 'Tổng giám đốc Canon Marketing Việt Nam: \"Canon nổi tiếng về máy ảnh nhưng cũng đứng đầu về giải pháp doanh nghiệp\"', '19154-Tong-giam-doc-Canon-Marketing-Viet-Nam-Canon-noi-tieng-ve-may-anh-nhung-cung-dung-dau-ve-giai-phap-doanh-nghiep', 'https://www.brandsvietnam.com/19154-Tong-giam-doc-Canon-Marketing-Viet-Nam-Canon-noi-tieng-ve-may-anh-nhung-cung-dung-dau-ve-giai-phap-doanh-nghiep', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(468, 'https://www.brandsvietnam.com/upload/news/200px/2019/19181_3.jpg', '\"Chết yểu\" quy hoạch ngành công nghiệp ô tô', '19181-Chet-yeu-quy-hoach-nganh-cong-nghiep-o-to', 'https://www.brandsvietnam.com/19181-Chet-yeu-quy-hoach-nganh-cong-nghiep-o-to', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(469, 'https://www.brandsvietnam.com/upload/news/200px/2019/19183_10.png', 'Vì sao Facebook, Instagram và YouTube muốn bỏ các chỉ số tương tác?', '19183-Vi-sao-Facebook-Instagram-va-YouTube-muon-bo-cac-chi-so-tuong-tac', 'https://www.brandsvietnam.com/19183-Vi-sao-Facebook-Instagram-va-YouTube-muon-bo-cac-chi-so-tuong-tac', ' div.reading-content', 1, '2019-10-02 08:55:42', '2020-03-03 16:09:13'),
(470, 'https://www.brandsvietnam.com/upload/news/200px/2019/19175_6.jpg', 'Đế chế Alibaba ra sao sau khi Jack Ma nghỉ hưu?', '19175-De-che-Alibaba-ra-sao-sau-khi-Jack-Ma-nghi-huu', 'https://www.brandsvietnam.com/19175-De-che-Alibaba-ra-sao-sau-khi-Jack-Ma-nghi-huu', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(471, 'https://www.brandsvietnam.com/upload/news/200px/2019/19148_21.jpg', 'Nữ tướng YellowBlocks', '19148-Nu-tuong-YellowBlocks', 'https://www.brandsvietnam.com/19148-Nu-tuong-YellowBlocks', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(472, 'https://www.brandsvietnam.com/upload/news/200px/2019/19108_10.jpg', 'WSJ: Việt Nam sẽ cần thêm nhiều năm nữa để trở thành công xưởng của thế giới', '19108-WSJ-Viet-Nam-se-can-them-nhieu-nam-nua-de-tro-thanh-cong-xuong-cua-the-gioi', 'https://www.brandsvietnam.com/19108-WSJ-Viet-Nam-se-can-them-nhieu-nam-nua-de-tro-thanh-cong-xuong-cua-the-gioi', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(473, 'https://www.brandsvietnam.com/upload/news/200px/2019/19142_5.jpeg', 'Jack Ma và Elon Musk \"khẩu chiến\" về trí tuệ nhân tạo, khai phá sao Hỏa', '19142-Jack-Ma-va-Elon-Musk-khau-chien-ve-tri-tue-nhan-tao-khai-pha-sao-Hoa', 'https://www.brandsvietnam.com/19142-Jack-Ma-va-Elon-Musk-khau-chien-ve-tri-tue-nhan-tao-khai-pha-sao-Hoa', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(474, 'https://www.brandsvietnam.com/upload/news/200px/2019/19090_11.jpg', 'Ý tưởng “khởi nghiệp toàn cầu” để thúc đẩy kinh tế số', '19090-Y-tuong-khoi-nghiep-toan-cau-de-thuc-day-kinh-te-so', 'https://www.brandsvietnam.com/19090-Y-tuong-khoi-nghiep-toan-cau-de-thuc-day-kinh-te-so', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(475, 'https://www.brandsvietnam.com/upload/news/200px/2019/19100_8.jpg', 'CEO Tập đoàn CMC: Kế hoạch Digital Hub', '19100-CEO-Tap-doan-CMC-Ke-hoach-Digital-Hub', 'https://www.brandsvietnam.com/19100-CEO-Tap-doan-CMC-Ke-hoach-Digital-Hub', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(476, 'https://www.brandsvietnam.com/upload/news/200px/2019/19082_3.jpg', '\"Chúng tôi sẽ công bố nhà đầu tư mạng xã hội Lotus nhưng không phải lúc này\"', '19082-Chung-toi-se-cong-bo-nha-dau-tu-mang-xa-hoi-Lotus-nhung-khong-phai-luc-nay', 'https://www.brandsvietnam.com/19082-Chung-toi-se-cong-bo-nha-dau-tu-mang-xa-hoi-Lotus-nhung-khong-phai-luc-nay', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(477, 'https://www.brandsvietnam.com/upload/news/200px/2019/19081_Fintech.jpg', 'Vì sao hạn chế đầu tư nước ngoài vào Fintech tại Việt Nam?', '19081-Vi-sao-han-che-dau-tu-nuoc-ngoai-vao-Fintech-tai-Viet-Nam', 'https://www.brandsvietnam.com/19081-Vi-sao-han-che-dau-tu-nuoc-ngoai-vao-Fintech-tai-Viet-Nam', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(478, 'https://www.brandsvietnam.com/upload/news/200px/2019/19114_19114_Ava_1.jpg', 'Bối rối quanh cam kết không làm việc cho đối thủ', '19114-Boi-roi-quanh-cam-ket-khong-lam-viec-cho-doi-thu', 'https://www.brandsvietnam.com/19114-Boi-roi-quanh-cam-ket-khong-lam-viec-cho-doi-thu', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(479, 'https://www.brandsvietnam.com/upload/news/200px/2019/19107_2.jpeg', '3 lời khuyên cho các nữ doanh nhân từ CEO startup tỷ đô Canva', '19107-3-loi-khuyen-cho-cac-nu-doanh-nhan-tu-CEO-startup-ty-do-Canva', 'https://www.brandsvietnam.com/19107-3-loi-khuyen-cho-cac-nu-doanh-nhan-tu-CEO-startup-ty-do-Canva', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(480, 'https://www.brandsvietnam.com/upload/news/200px/2019/19098_11.png', 'Chống hàng giả trong thương mại điện tử', '19098-Chong-hang-gia-trong-thuong-mai-dien-tu', 'https://www.brandsvietnam.com/19098-Chong-hang-gia-trong-thuong-mai-dien-tu', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(481, 'https://www.brandsvietnam.com/upload/news/200px/2019/19083_7.jpg', 'Đề án thúc đẩy mô hình kinh tế chia sẻ: Một chuyển biến trong hành động của Chính phủ', '19083-De-an-thuc-day-mo-hinh-kinh-te-chia-se-Mot-chuyen-bien-trong-hanh-dong-cua-Chinh-phu', 'https://www.brandsvietnam.com/19083-De-an-thuc-day-mo-hinh-kinh-te-chia-se-Mot-chuyen-bien-trong-hanh-dong-cua-Chinh-phu', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(482, 'https://www.brandsvietnam.com/upload/news/200px/2019/19075_19075_Ava_1.jpg', 'Shark Phú và tham vọng làm chủ công nghệ gốc ở Sunhouse', '19075-Shark-Phu-va-tham-vong-lam-chu-cong-nghe-goc-o-Sunhouse', 'https://www.brandsvietnam.com/19075-Shark-Phu-va-tham-vong-lam-chu-cong-nghe-goc-o-Sunhouse', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(483, 'https://www.brandsvietnam.com/upload/news/200px/2019/19079_2.jpg', 'Nhà sáng lập Huawei cảnh báo nhân viên về “thời khắc sống còn” của công ty', '19079-Nha-sang-lap-Huawei-canh-bao-nhan-vien-ve-thoi-khac-song-con-cua-cong-ty', 'https://www.brandsvietnam.com/19079-Nha-sang-lap-Huawei-canh-bao-nhan-vien-ve-thoi-khac-song-con-cua-cong-ty', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(484, 'https://www.brandsvietnam.com/upload/news/200px/2019/19103_10.jpg', 'CEO MoMo: MoMo sẽ là công cụ tài chính cho mọi người Việt, \"đo ni đóng giày\" cho người Việt', '19103-CEO-MoMo-MoMo-se-la-cong-cu-tai-chinh-cho-moi-nguoi-Viet-do-ni-dong-giay-cho-nguoi-Viet', 'https://www.brandsvietnam.com/19103-CEO-MoMo-MoMo-se-la-cong-cu-tai-chinh-cho-moi-nguoi-Viet-do-ni-dong-giay-cho-nguoi-Viet', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(485, 'https://www.brandsvietnam.com/upload/news/200px/2019/19106_4.jpg', 'Đằng sau tình bạn kéo dài hàng thập kỷ giữa Jeff Bezos và Jame Dimon', '19106-Dang-sau-tinh-ban-keo-dai-hang-thap-ky-giua-Jeff-Bezos-va-Jame-Dimon', 'https://www.brandsvietnam.com/19106-Dang-sau-tinh-ban-keo-dai-hang-thap-ky-giua-Jeff-Bezos-va-Jame-Dimon', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(486, 'https://www.brandsvietnam.com/upload/news/200px/2019/19092_10.jpg', 'Thu hút khách du lịch quốc tế đến Việt Nam bằng cách nào?', '19092-Thu-hut-khach-du-lich-quoc-te-den-Viet-Nam-bang-cach-nao', 'https://www.brandsvietnam.com/19092-Thu-hut-khach-du-lich-quoc-te-den-Viet-Nam-bang-cach-nao', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(487, 'https://www.brandsvietnam.com/upload/news/200px/2019/19074_3.jpg', 'CEO Soya Garden: Tiêu tiền của nhà đầu tư khó gấp 10 - 20 lần việc tiêu tiền của chính mình!', '19074-CEO-Soya-Garden-Tieu-tien-cua-nha-dau-tu-kho-gap-10-20-lan-viec-tieu-tien-cua-chinh-minh', 'https://www.brandsvietnam.com/19074-CEO-Soya-Garden-Tieu-tien-cua-nha-dau-tu-kho-gap-10-20-lan-viec-tieu-tien-cua-chinh-minh', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(488, 'https://www.brandsvietnam.com/upload/news/200px/2019/19061_10.jpg', 'Nhà đầu tư Nhật tìm kiếm gì từ các thương vụ M&A tại Việt Nam?', '19061-Nha-dau-tu-Nhat-tim-kiem-gi-tu-cac-thuong-vu-MA-tai-Viet-Nam', 'https://www.brandsvietnam.com/19061-Nha-dau-tu-Nhat-tim-kiem-gi-tu-cac-thuong-vu-MA-tai-Viet-Nam', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(489, 'https://www.brandsvietnam.com/upload/news/200px/2019/19055_19055_Ava_1.jpg', 'Ai hiểu khách hàng nhanh hơn, người ấy thắng', '19055-Ai-hieu-khach-hang-nhanh-hon-nguoi-ay-thang', 'https://www.brandsvietnam.com/19055-Ai-hieu-khach-hang-nhanh-hon-nguoi-ay-thang', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(490, 'https://www.brandsvietnam.com/upload/news/200px/2019/19049_6.jpg', 'Xu hướng phát triển chủ chốt của y tế, năng lượng và hàng không là gì?', '19049-Xu-huong-phat-trien-chu-chot-cua-y-te-nang-luong-va-hang-khong-la-gi', 'https://www.brandsvietnam.com/19049-Xu-huong-phat-trien-chu-chot-cua-y-te-nang-luong-va-hang-khong-la-gi', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(491, 'https://www.brandsvietnam.com/upload/news/200px/2019/19047_1007.jpg', 'Vì sao hàng hóa có tỷ lệ nội địa 30% sẽ được ghi \'made in Vietnam\'?', '19047-Vi-sao-hang-hoa-co-ty-le-noi-dia-30-se-duoc-ghi-made-in-Vietnam', 'https://www.brandsvietnam.com/19047-Vi-sao-hang-hoa-co-ty-le-noi-dia-30-se-duoc-ghi-made-in-Vietnam', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(492, 'https://www.brandsvietnam.com/upload/news/200px/2019/19015_4.jpeg', 'Những nông trại “cày view” bằng điện thoại, kiếm tiền từ giá trị ảo', '19015-Nhung-nong-trai-cay-view-bang-dien-thoai-kiem-tien-tu-gia-tri-ao', 'https://www.brandsvietnam.com/19015-Nhung-nong-trai-cay-view-bang-dien-thoai-kiem-tien-tu-gia-tri-ao', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(493, 'https://www.brandsvietnam.com/upload/news/200px/2019/19005_101.jpg', 'Xây dựng chính phủ điện tử cần bắt đầu từ “lấy dân làm gốc”', '19005-Xay-dung-chinh-phu-dien-tu-can-bat-dau-tu-lay-dan-lam-goc', 'https://www.brandsvietnam.com/19005-Xay-dung-chinh-phu-dien-tu-can-bat-dau-tu-lay-dan-lam-goc', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(494, 'https://www.brandsvietnam.com/upload/news/200px/2019/19014_cooktim02242017getty.jpg', 'Apple đang chi nhiều tiền cho “học thuyết Tim Cook”', '19014-Apple-dang-chi-nhieu-tien-cho-hoc-thuyet-Tim-Cook', 'https://www.brandsvietnam.com/19014-Apple-dang-chi-nhieu-tien-cho-hoc-thuyet-Tim-Cook', ' div.reading-content', 0, '2019-10-02 08:55:42', '2019-10-02 08:55:42'),
(495, 'https://www.brandsvietnam.com/upload/news/200px/2019/19010_10.jpg', 'Vì đâu Fintech hút vốn ngoại?', '19010-Vi-dau-Fintech-hut-von-ngoai', 'https://www.brandsvietnam.com/19010-Vi-dau-Fintech-hut-von-ngoai', ' div.reading-content', 0, '2019-10-02 08:55:43', '2019-10-02 08:55:43'),
(496, 'https://www.brandsvietnam.com/upload/news/200px/2019/19006_1.jpg', 'Ông Trần Hải Linh - Tổng giám đốc Sendo: Chúng tôi luôn tìm cách tạo giá trị cho xã hội', '19006-Ong-Tran-Hai-Linh-Tong-giam-doc-Sendo-Chung-toi-luon-tim-cach-tao-gia-tri-cho-xa-hoi', 'https://www.brandsvietnam.com/19006-Ong-Tran-Hai-Linh-Tong-giam-doc-Sendo-Chung-toi-luon-tim-cach-tao-gia-tri-cho-xa-hoi', ' div.reading-content', 0, '2019-10-02 08:55:43', '2019-10-02 08:55:43'),
(497, 'https://www.brandsvietnam.com/upload/news/200px/2019/18999_vnf-ngan-hang-quoc-doanh.jpg', 'Ngân hàng big 4 khát  vốn ngoại', '18999-Ngan-hang-big-4-khat-von-ngoai', 'https://www.brandsvietnam.com/18999-Ngan-hang-big-4-khat-von-ngoai', ' div.reading-content', 0, '2019-10-02 08:55:43', '2019-10-02 08:55:43'),
(498, 'https://www.brandsvietnam.com/upload/news/200px/2019/18982_18982_Ava_1.jpg', 'Warren Buffett: Đừng bao giờ nghe lời chuyên gia khi đầu tư', '18982-Warren-Buffett-Dung-bao-gio-nghe-loi-chuyen-gia-khi-dau-tu', 'https://www.brandsvietnam.com/18982-Warren-Buffett-Dung-bao-gio-nghe-loi-chuyen-gia-khi-dau-tu', ' div.reading-content', 0, '2019-10-02 08:55:43', '2019-10-02 08:55:43'),
(499, 'https://www.brandsvietnam.com/upload/news/200px/2019/paper-drinking-straws_1564973162.jpg', 'Ống hút nhựa: Thay thế hay tái chế?', '18972-Ong-hut-nhua-Thay-the-hay-tai-che', 'https://www.brandsvietnam.com/18972-Ong-hut-nhua-Thay-the-hay-tai-che', ' div.reading-content', 0, '2019-10-02 08:55:43', '2019-10-02 08:55:43'),
(500, 'https://www.brandsvietnam.com/upload/news/200px/2019/18968_1011.jpg', 'Mạng xã hội mới tại Việt Nam liệu có “chết yểu” trước Facebook, Zalo?', '18968-Mang-xa-hoi-moi-tai-Viet-Nam-lieu-co-chet-yeu-truoc-Facebook-Zalo', 'https://www.brandsvietnam.com/18968-Mang-xa-hoi-moi-tai-Viet-Nam-lieu-co-chet-yeu-truoc-Facebook-Zalo', ' div.reading-content', 0, '2019-10-02 08:55:43', '2019-10-02 08:55:43'),
(501, 'https://www.brandsvietnam.com/upload/news/200px/2019/18948_178a0112_281436476.jpg', 'Thách đấu Facebook: Không thể & có thể', '18948-Thach-dau-Facebook-Khong-the-co-the', 'https://www.brandsvietnam.com/18948-Thach-dau-Facebook-Khong-the-co-the', ' div.reading-content', 1, '2019-10-02 08:55:43', '2020-04-30 20:50:45'),
(502, 'https://www.brandsvietnam.com/upload/news/200px/2019/18934_13.jpg', 'CEO Tiki: Tôi tin trong vòng 5 năm tới, Việt Nam sẽ là đất nước của những kỳ lân!', '18934-CEO-Tiki-Toi-tin-trong-vong-5-nam-toi-Viet-Nam-se-la-dat-nuoc-cua-nhung-ky-lan', 'https://www.brandsvietnam.com/18934-CEO-Tiki-Toi-tin-trong-vong-5-nam-toi-Viet-Nam-se-la-dat-nuoc-cua-nhung-ky-lan', ' div.reading-content', 0, '2019-10-02 08:55:43', '2019-10-02 08:55:43'),
(503, 'https://www.brandsvietnam.com/upload/news/200px/2019/18933_3.jpg', 'Khởi nghiệp nên dùng tiền của bản thân hay của người khác?', '18933-Khoi-nghiep-nen-dung-tien-cua-ban-than-hay-cua-nguoi-khac', 'https://www.brandsvietnam.com/18933-Khoi-nghiep-nen-dung-tien-cua-ban-than-hay-cua-nguoi-khac', ' div.reading-content', 0, '2019-10-02 08:55:43', '2019-10-02 08:55:43'),
(504, 'https://www.brandsvietnam.com/upload/news/200px/2019/18927_1.jpg', 'Zalo không muốn là mạng xã hội?', '18927-Zalo-khong-muon-la-mang-xa-hoi', 'https://www.brandsvietnam.com/18927-Zalo-khong-muon-la-mang-xa-hoi', ' div.reading-content', 0, '2019-10-02 08:55:43', '2019-10-02 08:55:43'),
(505, 'https://www.brandsvietnam.com/upload/news/200px/2019/18928_avt1.jpg', '“3 năm nữa, người dân dùng Mobile Money sẽ không cần cầm ví tiền ra ngoài”', '18928-3-nam-nua-nguoi-dan-dung-Mobile-Money-se-khong-can-cam-vi-tien-ra-ngoai', 'https://www.brandsvietnam.com/18928-3-nam-nua-nguoi-dan-dung-Mobile-Money-se-khong-can-cam-vi-tien-ra-ngoai', ' div.reading-content', 0, '2019-10-02 08:55:43', '2019-10-02 08:55:43'),
(506, 'https://www.brandsvietnam.com/upload/news/200px/2019/18909_1banle.jpg', 'Savills: ‘Bán lẻ đòi hỏi đầu tư nhiều nhưng thu hồi vốn lại chậm’', '18909-Savills-Ban-le-doi-hoi-dau-tu-nhieu-nhung-thu-hoi-von-lai-cham', 'https://www.brandsvietnam.com/18909-Savills-Ban-le-doi-hoi-dau-tu-nhieu-nhung-thu-hoi-von-lai-cham', ' div.reading-content', 0, '2019-10-02 08:55:43', '2019-10-02 08:55:43'),
(507, 'https://www.brandsvietnam.com/upload/news/200px/2019/18910_1avt.jpg', 'Đấu nổi Google?', '18910-Dau-noi-Google', 'https://www.brandsvietnam.com/18910-Dau-noi-Google', ' div.reading-content', 0, '2019-10-02 08:55:43', '2019-10-02 08:55:43');

--
-- Triggers `news`
--
DELIMITER $$
CREATE TRIGGER `11123` BEFORE INSERT ON `news` FOR EACH ROW SET NEW.created_at = NOW(), NEW.updated_at = NOW()
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `1232333` BEFORE UPDATE ON `news` FOR EACH ROW SET NEW.updated_at = NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `num_like` int(11) NOT NULL DEFAULT 0,
  `num_dislike` int(11) NOT NULL DEFAULT 0,
  `num_answer` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `feature` varchar(255) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `id_user`, `slug`, `content`, `tag`, `num_like`, `num_dislike`, `num_answer`, `status`, `feature`, `class`, `created_at`, `updated_at`) VALUES
(1, 1, 'khoi-nghiep-nghia-la-gi-1581859760', 'khởi nghiệp nghĩa là gì', '[{\"text\":\"khởi nghiệp\"}]', 0, 0, 0, 1, NULL, NULL, '2020-02-16 20:29:20', '2020-02-16 20:29:20'),
(4, 1, 'khoi-nghiep-bang-kinh-doanh-do-uong-co-canh-tranh-khong-1581860036', 'Khởi nghiệp bằng kinh doanh đồ uống có cạnh tranh không ?', '[{\"text\":\"khởi nghiệp\"},{\"text\":\"đồ uống\"}]', 0, 1, 0, 1, NULL, NULL, '2020-02-16 20:33:56', '2020-02-16 20:33:56'),
(5, 1, 'tai-sao-phai-nop-thue-1581940435', 'Tại sao phải nộp thuế', '[{\"text\":\"thuế\"}]', 0, 0, 0, 1, NULL, NULL, '2020-02-17 18:53:55', '2020-02-17 18:53:55'),
(6, 1, 'co-can-thue-luat-su-khi-mo-cong-ty-hay-khong-1581940469', 'Có cần thuê luật sư khi mở công ty hay không', '[{\"text\":\"luật sư\"}]', 2, 0, 0, 1, NULL, NULL, '2020-02-17 18:54:29', '2020-02-17 18:54:29'),
(7, 1, 'tim-nha-dau-tu-o-dau-1581940508', 'Tìm nhà đầu tư ở đâu', '[{\"text\":\"nhà đầu tư\"}]', 0, 0, 0, 1, NULL, NULL, '2020-02-17 18:55:08', '2020-02-17 18:55:08'),
(8, 1, 'tien-te-duoc-luu-thong-nhu-the-nao-1581940543', 'Tiền tệ được lưu thông như thế nào', '[{\"text\":\"tiền\"}]', 0, 0, 0, 1, NULL, NULL, '2020-02-17 18:55:43', '2020-02-17 18:55:43'),
(9, 1, 'khi-bat-dau-kinh-doanh-thi-can-nhung-yeu-to-gi-1581940567', 'Khi bắt đầu kinh doanh thì cần những yếu tố gì', '[{\"text\":\"kinh doanh\"}]', 1, 0, 0, 1, NULL, NULL, '2020-02-17 18:56:07', '2020-02-17 18:56:07'),
(11, 4, 'tai-sao-phai-thanh-lap-doanh-nghiep-1582115654', 'Tại sao phải thành lập doanh nghiệp', '[{\"text\":\"doanh nghiệp\"}]', 0, 0, 0, 1, NULL, NULL, '2020-02-19 19:34:14', '2020-02-19 19:34:14');

-- --------------------------------------------------------

--
-- Table structure for table `question_user`
--

CREATE TABLE `question_user` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `question` text NOT NULL,
  `question_tokenizer` text NOT NULL,
  `feature` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question_user`
--

INSERT INTO `question_user` (`id`, `id_user`, `question`, `question_tokenizer`, `feature`) VALUES
(2, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(3, 1, 'adasd', 'adasd', NULL),
(4, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(5, 1, 'khởi nghiệp nghĩa là gì\\', 'khởi_nghiệp nghĩa_là gì', NULL),
(6, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(7, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(8, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(9, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(10, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(11, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(12, 1, 'định nghĩa của khởi nghiệp', 'định_nghĩa của khởi_nghiệp', NULL),
(13, 1, 'tại sao phải khởi nghiệ[', 'tại_sao phải khởi nghiệ', NULL),
(14, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(15, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(16, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(17, 1, 'các bước để khởi nghiệp', 'các bước để khởi_nghiệp', NULL),
(18, 1, 'tại sao khởi nghiệp thường thất bại', 'tại_sao khởi_nghiệp thường thất_bại', NULL),
(19, 1, 'start up là gì', 'start_up là gì', NULL),
(20, 1, 'hãy nêu định nghĩa của khởi nghiệp', 'hãy nêu định_nghĩa của khởi_nghiệp', NULL),
(21, 1, 'cho tôi biết định nghĩa của khởi nghiệp', 'cho tôi biết định_nghĩa của khởi_nghiệp', NULL),
(22, 1, 'khởi nghiệp là', 'khởi_nghiệp là', NULL),
(23, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(24, 1, 'đặc điểm cơ bản của khởi nghiệp', 'đặc_điểm cơ_bản của khởi_nghiệp', NULL),
(25, 1, 'khoi nghiep nghia la gi', 'khoi nghiep nghia la gi', NULL),
(26, 1, 'ccccccccc', 'ccccccccc', NULL),
(27, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(28, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(29, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(30, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(31, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(32, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(33, 1, 'ccccccc', 'ccccccc', NULL),
(34, 1, 'tại sao khởi nghiệp dễ thất bại', 'tại_sao khởi_nghiệp dễ thất_bại', NULL),
(35, 1, 'tại sao khởi nghiệp dễ thất bại', 'tại_sao khởi_nghiệp dễ thất_bại', NULL),
(36, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(37, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(38, 1, 'tại sao khởi nghiệp dễ thất bại', 'tại_sao khởi_nghiệp dễ thất_bại', NULL),
(39, 1, 'yếu tố nào của người khởi nghiệp', 'yếu_tố nào của người khởi_nghiệp', NULL),
(40, 1, 'khởi nghiệp cần gì', 'khởi_nghiệp cần gì', NULL),
(41, 1, 'tố chất để khởi nghiệp', 'tố_chất để khởi_nghiệp', NULL),
(42, 1, 'tố chất để khởi nghiệp', 'tố_chất để khởi_nghiệp', NULL),
(43, 1, 'đặc điểm của khởi nghiệp là gì', 'đặc_điểm của khởi_nghiệp là gì', NULL),
(44, 1, 'đặc điểm của khởi nghiệp là gì', 'đặc_điểm của khởi_nghiệp là gì', NULL),
(45, 1, 'số vốn để bắt đầu khởi nghiệp là bao nhiêu', 'số vốn để bắt_đầu khởi_nghiệp là bao_nhiêu', NULL),
(46, 1, 'tố chất để khởi nghiệp', 'tố_chất để khởi_nghiệp', NULL),
(47, 1, 'các bước để khởi nghiệp', 'các bước để khởi_nghiệp', NULL),
(48, 1, 'mục tiêu của khởi nghiệp', 'mục_tiêu của khởi_nghiệp', NULL),
(49, 1, 'mục tiêu của khởi nghiệp', 'mục_tiêu của khởi_nghiệp', NULL),
(50, 1, 'đặt cc', 'đặt cc', NULL),
(51, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(52, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(53, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(54, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(55, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(56, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(57, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(58, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(59, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(60, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(61, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(62, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(63, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(64, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(65, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(66, 1, 'tố chất của người khởi nghiệp', 'tố_chất của người khởi_nghiệp', NULL),
(67, 1, 'định nghĩa về từ khởi nghiệp', 'định_nghĩa về từ khởi_nghiệp', NULL),
(68, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(69, 1, 'cách để khởi nghiệp', 'cách để khởi_nghiệp', NULL),
(70, 1, 'số vốn để khởi nghiệp là bao nhiêu', 'số vốn để khởi_nghiệp là bao_nhiêu', NULL),
(71, 1, 'ccc', 'ccc', NULL),
(72, 1, 'định nghĩa của khởi nghiệp', 'định_nghĩa của khởi_nghiệp', NULL),
(73, 1, 'sao phải khởi nghiệp', 'sao phải khởi_nghiệp', NULL),
(74, 1, 'tao muốn khởi nghiệp', 'tao muốn khởi_nghiệp', NULL),
(75, 1, 'đặc điểm của khởi nghiệp là gì', 'đặc_điểm của khởi_nghiệp là gì', NULL),
(76, 1, 'start up là gì', 'start_up là gì', NULL),
(77, 1, '123', '123', NULL),
(78, 1, '123', '123', NULL),
(79, 1, '123', '123', NULL),
(80, 1, '123', '123', NULL),
(81, 1, '123', '123', NULL),
(82, 1, '123', '123', NULL),
(83, 1, 'ads', 'ads', NULL),
(84, 1, 'aa', 'aa', NULL),
(85, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(86, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(87, 1, 'tố chất của người khởi nghiệp', 'tố_chất của người khởi_nghiệp', NULL),
(88, 1, 'tố chất của người khởi nghiệp', 'tố_chất của người khởi_nghiệp', NULL),
(89, 1, 'tố chất của người khởi nghiệp', 'tố_chất của người khởi_nghiệp', NULL),
(90, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(91, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(92, 1, 'lí do để khởi nghiệp', 'lí_do để khởi_nghiệp', NULL),
(93, 1, 'định nghĩa về khởi nghiệp', 'định_nghĩa về khởi_nghiệp', NULL),
(94, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(95, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(96, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(97, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(98, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(99, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(100, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(101, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(102, 1, 'ccccccccc', 'ccccccccc', NULL),
(103, 1, 'khởi nghiệp', 'khởi_nghiệp', NULL),
(104, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(105, 1, 'con cặc', 'con cặc', NULL),
(106, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(107, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(108, 1, 'vì sao phải khởi nghiệp', 'vì_sao phải khởi_nghiệp', NULL),
(109, 1, 'lí do để khởi nghiệp là gì', 'lí_do để khởi_nghiệp là gì', NULL),
(110, 1, 'lí do để khởi nghiệp là gì', 'lí_do để khởi_nghiệp là gì', NULL),
(111, 1, 'vì sao phải khởi nghiệp', 'vì_sao phải khởi_nghiệp', NULL),
(112, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(113, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(114, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(115, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(116, 1, 'định nghĩa về khởi nghiệp', 'định_nghĩa về khởi_nghiệp', NULL),
(117, 1, 'startup là gì', 'startup là gì', NULL),
(118, 1, 'startup là gì', 'startup là gì', NULL),
(119, 1, 'startup là gì', 'startup là gì', NULL),
(120, 1, 'star tup là gì', 'star tup là gì', NULL),
(121, 1, 'start up là gì', 'start_up là gì', NULL),
(122, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(123, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(124, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(125, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(126, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(127, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(128, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(129, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(130, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(131, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(132, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(133, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(134, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(135, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(136, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(137, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(138, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(139, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(140, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(141, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(142, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(143, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(144, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(145, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(146, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(147, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(148, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(149, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(150, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(151, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(152, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(153, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(154, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(155, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(156, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(157, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(158, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(159, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(160, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(161, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(162, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(163, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(164, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(165, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(166, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(167, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(168, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(169, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(170, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(171, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(172, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(173, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(174, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(175, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(176, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(177, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(178, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(179, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(180, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(181, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(182, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(183, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(184, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(185, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(186, 1, 'vì sao phải khởi nghiệp', 'vì_sao phải khởi_nghiệp', NULL),
(187, 1, 'người khởi nghiệp cần yếu tố gì', 'người khởi_nghiệp cần_yếu tố gì', NULL),
(188, 1, 'người khởi nghiệp cần yếu tố gì', 'người khởi_nghiệp cần_yếu tố gì', NULL),
(189, 1, 'người khởi nghiệp cần yếu tố gì', 'người khởi_nghiệp cần_yếu tố gì', NULL),
(190, 1, 'start up là gì', 'start_up là gì', NULL),
(191, 1, 'startup là gì', 'startup là gì', NULL),
(192, 1, 'startup là gì', 'startup là gì', NULL),
(193, 1, 'startup là gì', 'startup là gì', NULL),
(194, 1, 'start up là gì', 'start_up là gì', NULL),
(195, 1, 'start up là gì', 'start_up là gì', NULL),
(196, 1, 'abc', 'abc', NULL),
(197, 1, 'start up là gì', 'start_up là gì', NULL),
(198, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(199, 1, 'start up là gì', 'start_up là gì', NULL),
(200, 1, 'start up là gì', 'start_up là gì', NULL),
(201, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(202, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(203, 1, 'start up là gì', 'start_up là gì', NULL),
(204, 1, 'startup là gì', 'startup là gì', NULL),
(205, 1, 'cần bao nhiêu tiền để khởi nghiệp', 'cần bao_nhiêu tiền để khởi_nghiệp', NULL),
(206, 1, 'cần bao nhiêu tiền để khởi nghiệp', 'cần bao_nhiêu tiền để khởi_nghiệp', NULL),
(207, 1, 'cần bao nhiêu tiền để khởi nghiệp', 'cần bao_nhiêu tiền để khởi_nghiệp', NULL),
(208, 1, 'cần bao nhiêu vốnđể khởi nghiệp', 'cần bao_nhiêu vốnđể khởi_nghiệp', NULL),
(209, 1, 'cần bao nhiêu vốn \\để khởi nghiệp', 'cần bao_nhiêu vốn để khởi_nghiệp', NULL),
(210, 1, 'cần bao nhiêu vốn để khởi nghiệp', 'cần bao_nhiêu vốn để khởi_nghiệp', NULL),
(211, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(212, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(213, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(214, 1, 'cần bao nhiêu tiền để khởi nghiệp', 'cần bao_nhiêu tiền để khởi_nghiệp', NULL),
(215, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(216, 1, 'cần bao nhiêu vốn để khởi nghiệp', 'cần bao_nhiêu vốn để khởi_nghiệp', NULL),
(217, 1, 'cần bao nhiêu xèng để khởi nghiệp', 'cần bao_nhiêu xèng để khởi_nghiệp', NULL),
(218, 1, 'bắt đầu khởi nghiệp cần số tiền bao nhiêu', 'bắt_đầu khởi_nghiệp cần số tiền bao_nhiêu', NULL),
(219, 1, 'start up là gì', 'start_up là gì', NULL),
(220, 1, 'start up là gì', 'start_up là gì', NULL),
(221, 1, 'lí do để khởi nghịeep', 'lí_do để khởi nghịeep', NULL),
(222, 1, 'lí do để khởi nghiệp', 'lí_do để khởi_nghiệp', NULL),
(223, 1, 'khởi nghiệp được hiểu như thế nào', 'khởi_nghiệp được hiểu như_thế nào', NULL),
(224, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(225, 1, 'lí do để khởi nghiệp', 'lí_do để khởi_nghiệp', NULL),
(226, 1, 'phẩm chất của người khởi nghiệp là gì', 'phẩm_chất của người khởi_nghiệp là gì', NULL),
(227, 1, 'yếu tố cần có của người khởi nghiệp', 'yếu_tố cần có_của người khởi_nghiệp', NULL),
(228, 1, 'yếu tố cần có của người khởi nghiệp', 'yếu_tố cần có của người khởi_nghiệp', NULL),
(229, 1, 'quá trình để khởi nghiệp là gì', 'quá_trình để khởi_nghiệp là gì', NULL),
(230, 1, 'quá trình để khởi nghiệp là gì', 'quá_trình để khởi_nghiệp là gì', NULL),
(231, 1, 'quá trình để khởi nghiệp là gì', 'quá_trình để khởi_nghiệp là gì', NULL),
(232, 1, 'các bước để khởi nghiệp', 'các_bước để khởi_nghiệp', NULL),
(233, 1, 'các bước để khởi nghiệp', 'các_bước để khởi_nghiệp', NULL),
(234, 1, 'khởi nghiệp có những mục tiêu gì', 'khởi_nghiệp có những mục_tiêu gì', NULL),
(235, 1, 'cần bao nhiều tiền để khởi nghiệo', 'cần bao nhiều tiền để khởi nghiệo', NULL),
(236, 1, 'cần bao nhiều tiền để khởi nghiệp', 'cần bao nhiều tiền để khởi_nghiệp', NULL),
(237, 1, 'cần bao nhiêu tiền để khởi nghiệp', 'cần bao_nhiêu tiền để khởi_nghiệp', NULL),
(238, 1, 'cần bao nhiêu tiền để khởi nghiệp', 'cần bao_nhiêu tiền để khởi_nghiệp', NULL),
(239, 1, 'cần bao nhiêu vố để khởi nghiệp', 'cần bao_nhiêu vố để khởi_nghiệp', NULL),
(240, 1, 'cần bao nhiêu vốn để khởi nghiệp', 'cần bao_nhiêu vốn để khởi_nghiệp', NULL),
(241, 1, 'nguyên nào khiến khởi nghiệp thất bại', 'nguyên nào khiến khởi_nghiệp thất_bại', NULL),
(242, 1, 'nguyên nhân nào khiến khởi nghiệp thất bại', 'nguyên_nhân nào khiến khởi_nghiệp thất_bại', NULL),
(243, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(244, 1, 'start up là gì', 'start_up là gì', NULL),
(245, 1, 'vì sao phải khởi nghiệp', 'vì_sao phải khởi_nghiệp', NULL),
(246, 1, 'tôi muốn khởi nghiệp thì cần bao nhiêu tiền', 'tôi muốn khởi_nghiệp thì cần bao_nhiêu tiền', NULL),
(247, 1, 'số vốn để có thể bắt đầu khởi nghiệp', 'số vốn để có_thể bắt_đầu khởi_nghiệp', NULL),
(248, 1, 'vì sao phải khởi nghiệp', 'vì_sao phải khởi_nghiệp', NULL),
(249, 1, 'vì sao khởi nghiệp thường thất bại', 'vì_sao khởi_nghiệp thường thất_bại', NULL),
(250, 1, 'lĩnh vực nào có thể khởi nghiệp', 'lĩnh_vực nào có_thể khởi_nghiệp', NULL),
(251, 1, 'phẩm chất của những người khởi nghiệp là gì', 'phẩm_chất của những người khởi_nghiệp là gì', NULL),
(252, 1, 'những người khởi nghiệp thường có những phẩm chất gì', 'những người khởi_nghiệp thường có những phẩm_chất gì', NULL),
(253, 1, 'những người khởi nghiệp thường có những phẩm chất gì', 'những người khởi_nghiệp thường có những phẩm_chất gì', NULL),
(254, 1, 'những người khởi nghiệp thường có những phẩm chất gì', 'những người khởi_nghiệp thường có những phẩm_chất gì', NULL),
(255, 1, 'những người khởi nghiệp thường có những phẩm chất gì', 'những người khởi_nghiệp thường có những phẩm_chất gì', NULL),
(256, 1, 'những người khởi nghiệp thường có những phẩm chất gì', 'những người khởi_nghiệp thường có những phẩm_chất gì', NULL),
(257, 1, 'những người khởi nghiệp thường có những phẩm chất gì', 'những người khởi_nghiệp thường có những phẩm_chất gì', NULL),
(258, 1, 'khởi nghiệp cần những yếu tố gì', 'khởi_nghiệp cần những yếu_tố gì', NULL),
(259, 1, 'người khởi nghiệp cần những yếu tố gì', 'người khởi_nghiệp cần những yếu_tố gì', NULL),
(260, 1, 'vì sao nên khởi nghiệp', 'vì_sao nên khởi_nghiệp', NULL),
(261, 1, 'tôi la ai', 'tôi la ai', NULL),
(262, 1, 'bạn biết tôi không', 'bạn biết tôi không', NULL),
(263, 1, 'bạn biết tôi không', 'bạn biết tôi không', NULL),
(264, 1, 'bạn biết tôi không', 'bạn biết tôi không', NULL),
(265, 1, 'bạn là ai', 'bạn là_ai', NULL),
(266, 1, 'địt ocococo\\', 'địt ocococo', NULL),
(267, 1, 'tao muốn khởi nghiệp', 'tao muốn khởi_nghiệp', NULL),
(268, 1, 'sai rồi', 'sai rồi', NULL),
(269, 1, 'chán', 'chán', NULL),
(270, 1, 'vì sao tao phải khởi nghiệp', 'vì_sao tao phải khởi_nghiệp', NULL),
(271, 1, 'vì sao phải khởi nghiệp', 'vì_sao phải khởi_nghiệp', NULL),
(272, 1, 'vì sao tao phải khởi nghiệp', 'vì_sao tao phải khởi_nghiệp', NULL),
(273, 1, 'vì sao tao phải khởi nghiệp', 'vì_sao tao phải khởi_nghiệp', NULL),
(274, 1, 'vì sao tao phải khởi nghiệp', 'vì_sao tao phải khởi_nghiệp', NULL),
(275, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(276, 1, 'tao không muốn khởi nghiệp', 'tao không muốn khởi_nghiệp', NULL),
(277, 1, 'khởi nghiệp', 'khởi_nghiệp', NULL),
(278, 1, 'chán', 'chán', NULL),
(279, 1, 'tao cần tiền', 'tao cần tiền', NULL),
(280, 1, 'tao cần tiền để khởi nghiệp', 'tao cần tiền để khởi_nghiệp', NULL),
(281, 1, 'tao cần tiền để khởi nghiệpchán vcl', 'tao cần tiền để khởi nghiệpchán vcl', NULL),
(282, 1, 'những người khởi nghiệp cần yếu tố gì', 'những người khởi_nghiệp cần_yếu tố gì', NULL),
(283, 1, 'những người khởi nghiệp cần yếu tố gì', 'những người khởi_nghiệp cần_yếu tố gì', NULL),
(284, 1, 'những người khởi nghiệp cần yếu tố gì', 'những người khởi_nghiệp cần yếu_tố gì', NULL),
(285, 1, 'những người khởi nghiệp cần yếu tố gì', 'những người khởi_nghiệp cần yếu_tố gì', NULL),
(286, 1, 'tôi muốn khởi nghiệp vậy tôi cần phải có những phẩm chất gì', 'tôi muốn khởi_nghiệp vậy tôi cần phải có những phẩm_chất gì', NULL),
(287, 1, 'tôi muốn khởi nghiệp vậy tôi cần phải có những phẩm chất gì', 'tôi muốn khởi_nghiệp vậy tôi cần phải có những phẩm_chất gì', NULL),
(288, 1, 'tôi muốn khởi nghiệp vậy tôi cần phải có những phẩm chất gì', 'tôi muốn khởi_nghiệp vậy tôi cần phải có những phẩm_chất gì', NULL),
(289, 1, 'tôi muốn khởi nghiệp vậy tôi cần phải có những phẩm chất gì', 'tôi muốn khởi_nghiệp vậy tôi cần phải có những phẩm_chất gì', NULL),
(290, 1, 'tôi muốn khởi nghiệp vậy tôi cần phải có những phẩm chất gì', 'tôi muốn khởi_nghiệp vậy tôi cần phải có những phẩm_chất gì', NULL),
(291, 1, 'tôi muốn khởi nghiệp vậy tôi cần phải có những phẩm chất gì', 'tôi muốn khởi_nghiệp vậy tôi cần phải có những phẩm_chất gì', NULL),
(292, 1, 'tôi muốn khởi nghiệp vậy tôi cần phải có những phẩm chất gì', 'tôi muốn khởi_nghiệp vậy tôi cần phải có những phẩm_chất gì', NULL),
(293, 1, 'tôi muốn khởi nghiệp vậy tôi cần phải có những phẩm chất gì', 'tôi muốn khởi_nghiệp vậy tôi cần phải có những phẩm_chất gì', NULL),
(294, 1, 'tôi muốn khởi nghiệp vậy tôi cần phải có những phẩm chất gì', 'tôi muốn khởi_nghiệp vậy tôi cần phải có những phẩm_chất gì', NULL),
(295, 1, 'tôi muốn khởi nghiệp vậy tôi cần phải có những phẩm chất gì', 'tôi muốn khởi_nghiệp vậy tôi cần phải có những phẩm_chất gì', NULL),
(296, 1, 'tôi nên danh ra số vốn bao nhiêu khi bắt đầu khởi nghiệp', 'tôi nên_danh ra số vốn bao_nhiêu khi bắt_đầu khởi_nghiệp', NULL),
(297, 1, 'khi khởi nghiệp thì cần những gì', 'khi khởi_nghiệp thì cần những gì', NULL),
(298, 1, 'tại sao nên khởi nghiệp', 'tại_sao nên khởi_nghiệp', NULL),
(299, 1, 'hãy cho tôi biết định nghĩa của khởi nghiệp', 'hãy cho tôi biết định_nghĩa của khởi_nghiệp', NULL),
(300, 1, 'hãy cho tôi biết định nghĩa của khởi nghiệp', 'hãy cho tôi biết định_nghĩa của khởi_nghiệp', NULL),
(301, 1, 'vì sao phải khởi nghiệp', 'vì_sao phải khởi_nghiệp', NULL),
(302, 1, 'số vốn để khởi nghiệp', 'số vốn để khởi_nghiệp', NULL),
(303, 1, 'số vốn để bắt đầu khởi nghiệp', 'số vốn để bắt_đầu khởi_nghiệp', NULL),
(304, 1, 'vốn để bắt đầu khởi nghiệp', 'vốn để bắt_đầu khởi_nghiệp', NULL),
(305, 1, 'tiền để khởi nghiệp', 'tiền để khởi_nghiệp', NULL),
(306, 1, 'tiền để khởi nghiệp', 'tiền để khởi_nghiệp', NULL),
(307, 1, 'cần bao nhiêu tiền để khởi nghiệp', 'cần bao_nhiêu tiền để khởi_nghiệp', NULL),
(308, 1, 'số vốn để khởi nghiệp', 'số vốn để khởi_nghiệp', NULL),
(309, 1, 'số vốn ban đầu để khởi nghiệp là bao nhiêu', 'số vốn ban_đầu để khởi_nghiệp là bao_nhiêu', NULL),
(310, 1, 'cần bao nhiêu vốn để có thể bắt đầu khởi nghiệp', 'cần bao_nhiêu vốn để có_thể bắt_đầu khởi_nghiệp', NULL),
(311, 1, 'vì sao chúng ta nên khởi nghiệp', 'vì_sao chúng_ta nên khởi_nghiệp', NULL),
(312, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa là gì', NULL),
(313, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(314, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa là gì', NULL),
(315, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa là gì', NULL),
(316, 1, 'khởi nghiệp được hiểu như thế nào', 'khởi_nghiệp được hiểu như_thế nào', NULL),
(317, 1, 'khởi nghiệp được định nghĩa là gì', 'khởi_nghiệp được định_nghĩa là gì', NULL),
(318, 1, 'khởi nghiệp được hiểu như thế nào', 'khởi_nghiệp được hiểu như_thế nào', NULL),
(319, 1, 'khởi nghiệp được hiểu như thế nào', 'khởi_nghiệp được hiểu như_thế nào', NULL),
(320, 1, 'khởi nghiệp được định nghĩa như thế nào', 'khởi_nghiệp được định_nghĩa như_thế nào', NULL),
(321, 1, 'khởi nghiệp được định nghĩa như thế nào', 'khởi_nghiệp được định_nghĩa như_thế nào', NULL),
(322, 1, 'khái niệm về khởi nghiệp', 'khái_niệm về khởi_nghiệp', NULL),
(323, 1, 'khái niệm về khởi nghiệp', 'khái_niệm về khởi_nghiệp', NULL),
(324, 1, 'khái niệm về khởi nghiệp', 'khái_niệm về khởi_nghiệp', NULL),
(325, 1, 'khởi nghiệp được hiểu như thế nào', 'khởi_nghiệp được hiểu như_thế nào', NULL),
(326, 1, 'khởi nghiệp được hiểu như thế nào', 'khởi_nghiệp được hiểu như_thế nào', NULL),
(327, 1, 'hãy nêu khái niệm về khởi nghiệp', 'hãy nêu khái_niệm về khởi_nghiệp', NULL),
(328, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(329, 1, 'khởi nghiệp cần bao nhiêu tiền', 'khởi_nghiệp cần bao_nhiêu tiền', NULL),
(330, 1, 'số vốn để có thể bắt đầu khởi nghiệp', 'số vốn để có_thể bắt_đầu khởi_nghiệp', NULL),
(331, 1, 'lí do nào để khởi nghiệp', 'lí_do nào để khởi_nghiệp', NULL),
(332, 1, 'một số lĩnh vực để khởi nghiệp', 'một_số lĩnh_vực để khởi_nghiệp', NULL),
(333, 1, 'một số lĩnh vực để khởi nghiệp', 'một_số lĩnh_vực để khởi_nghiệp', NULL),
(334, 1, 'một số lĩnh vực để khởi nghiệp', 'một_số lĩnh_vực để khởi_nghiệp', NULL),
(335, 1, 'một số lĩnh vực để khởi nghiệp', 'một_số lĩnh_vực để khởi_nghiệp', NULL),
(336, 1, 'một số lĩnh vực để khởi nghiệp', 'một_số lĩnh_vực để khởi_nghiệp', NULL),
(337, 1, 'một số lĩnh vực để khởi nghiệp', 'một_số lĩnh_vực để khởi_nghiệp', NULL),
(338, 1, 'một số lĩnh vực để khởi nghiệp', 'một_số lĩnh_vực để khởi_nghiệp', NULL),
(339, 1, 'các lĩnh vực để khởi nghiệp', 'các lĩnh_vực để khởi_nghiệp', NULL),
(340, 1, 'nên khởi nghiệp hay không', 'nên khởi_nghiệp hay_không', NULL),
(341, 1, 'khởi nghiệp', 'khởi_nghiệp', NULL),
(342, 1, 'lí do nên khởi nghiệp', 'lí_do nên khởi_nghiệp', NULL),
(343, 1, 'yếu tố của người khởi nghiệp', 'yếu_tố của người khởi_nghiệp', NULL),
(344, 1, 'tố chất cần có của người khởi nghiệp', 'tố_chất cần có của người khởi_nghiệp', NULL),
(345, 1, 'tố chất cần có của người khởi nghiệp', 'tố_chất cần có của người khởi_nghiệp', NULL),
(346, 1, 'tố chất cần có của người khởi nghiệp', 'tố_chất cần có của người khởi_nghiệp', NULL),
(347, 1, 'tố chất cần có của người khởi nghiệp', 'tố_chất cần có của người khởi_nghiệp', NULL),
(348, 1, 'đối tượng nào có thể khởi nghiệp', 'đối_tượng nào có_thể khởi_nghiệp', NULL),
(349, 1, 'ai có thể khởi nghiệp', 'ai có_thể khởi_nghiệp', NULL),
(350, 1, 'người nào có thể khởi nghiệp', 'người nào có_thể khởi_nghiệp', NULL),
(351, 1, 'ai có thể khởi nghiệp', 'ai có_thể khởi_nghiệp', NULL),
(352, 1, 'đối tượng nào có thể khởi nghiệp', 'đối_tượng nào có_thể khởi_nghiệp', NULL),
(353, 1, 'đối tượng khởi nghiệp bao gồm những ai', 'đối_tượng khởi_nghiệp bao_gồm những_ai', NULL),
(354, 1, 'startup được định nghĩa là gì', 'startup được định_nghĩa là gì', NULL),
(355, 1, 'vì sao phải đóng thuế', 'vì_sao phải đóng thuế', NULL),
(356, 1, 'vì sao phải nộp thuế thu nhập cá nhân', 'vì_sao phải nộp thuế thu_nhập cá_nhân', NULL),
(357, 1, 'tại sao phải đóng thuế thu nhập cá nhân', 'tại_sao phải đóng thuế thu_nhập cá_nhân', NULL),
(358, 1, 'tại sao phải nộp thuế TNCN', 'tại_sao phải nộp thuế tncn', NULL),
(359, 1, 'tại sao phải nộp thuế TNCN', 'tại_sao phải nộp thuế tncn', NULL),
(360, 1, 'vì sao tôi phải nộp thuế tncn', 'vì_sao tôi phải nộp thuế tncn', NULL),
(361, 1, 'thuế là gì', 'thuế là gì', NULL),
(362, 1, 'tại sao mọi người phải nộp thuế thu nhập cá nhân', 'tại_sao mọi người phải nộp thuế thu_nhập cá_nhân', NULL),
(363, 1, 'tại sao mọi người phải nộp thuế tncn', 'tại_sao mọi người phải nộp thuế tncn', NULL),
(364, 1, 'vì sao phải nộp thuế', 'vì_sao phải nộp thuế', NULL),
(365, 1, 'vì sao phải nộp thuế tncn', 'vì_sao phải nộp thuế tncn', NULL),
(366, 1, 'tại sao phải đóng thuế tncn', 'tại_sao phải đóng thuế tncn', NULL),
(367, 1, 'tại sao phải đóng thuế tncn', 'tại_sao phải đóng thuế tncn', NULL),
(368, 1, 'vì sao phải nộp thuế thu nhập', 'vì_sao phải nộp thuế thu_nhập', NULL),
(369, 1, 'vì sao phải nộp thuế thu nhập cá nhân', 'vì_sao phải nộp thuế thu_nhập cá_nhân', NULL),
(370, 1, 'vì sao phải nộp thuế cá nhân', 'vì_sao phải nộp thuế cá_nhân', NULL),
(371, 1, 'vì sao phải nộp thuế cá nhân', 'vì_sao phải nộp thuế cá_nhân', NULL),
(372, 1, 'vì sao phải nộp thuế cá nhân', 'vì_sao phải nộp thuế cá_nhân', NULL),
(373, 1, 'định nghĩa khởi nghiệp', 'định_nghĩa khởi_nghiệp', NULL),
(374, 1, 'lí đo để khởi nghiệp', 'lí đo để khởi_nghiệp', NULL),
(375, 1, 'lí đo để khởi nghiệp', 'lí đo để khởi_nghiệp', NULL),
(376, 1, 'lí đo để khởi nghiệp', 'lí đo để khởi_nghiệp', NULL),
(377, 1, 'lí do để khởi nghiệp', 'lí_do để khởi_nghiệp', NULL),
(378, 1, 'lí do để khởi nghiệp', 'lí_do để khởi_nghiệp', NULL),
(379, 1, 'tại sao phải thành lập doanh nghiệp', 'tại_sao phải thành_lập doanh_nghiệp', NULL),
(380, 1, 'cần bao nhiêu tiền để khởi nghiệp', 'cần bao_nhiêu tiền để khởi_nghiệp', NULL),
(381, 1, 'số vốn để khởi nghiệp', 'số vốn để khởi_nghiệp', NULL),
(382, 1, 'vì sao chúng ta nên khởi nghiệp', 'vì_sao chúng_ta nên khởi_nghiệp', NULL),
(383, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(384, 1, 'tố chất của những người khởi nghiệp là gì', 'tố_chất của những người khởi_nghiệp là gì', NULL),
(385, 1, 'đặc điểm của khởi nghiệp là gì', 'đặc_điểm của khởi_nghiệp là gì', NULL),
(386, 1, 'đặc điểm của khởi nghiệp là gì', 'đặc_điểm của khởi_nghiệp là gì', NULL),
(387, 1, 'đặc điểm của khởi nghiệp là gì', 'đặc_điểm của khởi_nghiệp là gì', NULL),
(388, 1, 'đặc điểm của khởi nghiệp là gì', 'đặc_điểm của khởi_nghiệp là gì', NULL),
(389, 1, 'đặc điểm của khởi nghiệp là gì', 'đặc_điểm của khởi_nghiệp là gì', NULL),
(390, 1, 'mục tiêu của khởi nghiệp là gì', 'mục_tiêu của khởi_nghiệp là gì', NULL),
(391, 1, 'mục đíhc của khởi nghiệp là gì', 'mục đíhc của khởi_nghiệp là gì', NULL),
(392, 1, 'mục đích của khởi nghiệp là gì', 'mục_đích của khởi_nghiệp là gì', NULL),
(393, 1, 'mục đích của khởi nghiệp là gì', 'mục_đích của khởi_nghiệp là gì', NULL),
(394, 1, 'mục đích của khởi nghiệp là gì', 'mục_đích của khởi_nghiệp là gì', NULL),
(395, 1, 'mục đích của khởi nghiệp', 'mục_đích của khởi_nghiệp', NULL),
(396, 1, 'mục tiêu của khởi nghiệp là gì', 'mục_tiêu của khởi_nghiệp là gì', NULL),
(397, 1, 'vì sao mọi người phải nộp thuế tncn', 'vì_sao mọi người phải nộp thuế tncn', NULL),
(398, 1, 'vì sao mọi người phải nộp thuế tncn', 'vì_sao mọi người phải nộp thuế tncn', NULL),
(399, 1, 'vì sao mọi người phải nộp thuế tncn', 'vì_sao mọi người phải nộp thuế tncn', NULL),
(400, 1, 'sao phải nộp thuế', 'sao phải nộp thuế', NULL),
(401, 1, 'tại sao phải nộp thuế', 'tại_sao phải nộp thuế', NULL),
(402, 1, 'tại sao phải nộp thuế thu nhập cá nhân', 'tại_sao phải nộp thuế thu_nhập cá_nhân', NULL),
(403, 1, 'lí do nào mọi người phải nộp thuế tncn', 'lí_do nào mọi người phải nộp thuế tncn', NULL),
(404, 1, 'tại sao mọi người phải nộp thuế', 'tại_sao mọi người phải nộp thuế', NULL),
(405, 1, 'tại sao mọi người phải nộp thuế tncn', 'tại_sao mọi người phải nộp thuế tncn', NULL),
(406, 1, 'quá trình để khởi nghiệp', 'quá_trình để khởi_nghiệp', NULL),
(407, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(408, 1, 'startup là gì', 'startup là gì', NULL),
(409, 1, 'bao nhiêu tiền thì có thể khởi nghiệp', 'bao_nhiêu tiền thì_có thể khởi_nghiệp', NULL),
(410, 1, 'số vốn ban đầu để khởi nghiệp là bao nhiêu', 'số vốn ban_đầu để khởi_nghiệp là bao_nhiêu', NULL),
(411, 1, 'cần bao nhiêu tiền để có thể khởi nghiệp', 'cần bao_nhiêu tiền để có_thể khởi_nghiệp', NULL),
(412, 1, 'số vốn ban đầu để khởi nghiệp', 'số vốn ban_đầu để khởi_nghiệp', NULL),
(413, 1, 'số vốn ban đầu để khởi nghiệp là bao nhiêu', 'số vốn ban_đầu để khởi_nghiệp là bao_nhiêu', NULL),
(414, 1, 'tại sao phải nộp thuế tncn', 'tại_sao phải nộp thuế tncn', NULL),
(415, 1, 'vì sao phải đóng thuế thu nhập cá nhân', 'vì_sao phải đóng thuế thu_nhập cá_nhân', NULL),
(416, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(417, 1, 'startup là gì', 'startup là gì', NULL),
(418, 1, 'cần bao nhiêu tiền để có thể khởi nghiệp', 'cần bao_nhiêu tiền để có_thể khởi_nghiệp', NULL),
(419, 1, 'số vốn để có thể bắt đầu khởi nghiệp là bao nhiêu', 'số vốn để có_thể bắt_đầu khởi_nghiệp là bao_nhiêu', NULL),
(420, 1, 'cần bao nhiêu tiền thì có thể khởi nghiệp', 'cần bao_nhiêu tiền thì_có thể khởi_nghiệp', NULL),
(421, 1, 'số vốn ban đầu để khởi nghiệp là bao nhiêu', 'số vốn ban_đầu để khởi_nghiệp là bao_nhiêu', NULL),
(422, 1, 'vì sao phải khởi nghiệp', 'vì_sao phải khởi_nghiệp', NULL),
(423, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa là gì', NULL),
(424, 1, 'startup nghĩa là gì', 'startup nghĩa là gì', NULL),
(425, 1, 'định nghĩa của khởi nghiệp', 'định_nghĩa của khởi_nghiệp', NULL),
(426, 1, 'tại sao phải nộp thuế tncn', 'tại_sao phải nộp thuế tncn', NULL),
(427, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(428, 1, 'startup là gì', 'startup là gì', NULL),
(429, 1, 'khởi nghiệp được hiểu như thế nào', 'khởi_nghiệp được hiểu như_thế nào', NULL),
(430, 1, 'Tại sao phải nộp thuế thu nhập cá nhân', 'tại_sao phải nộp thuế thu_nhập cá_nhân', NULL),
(431, 1, 'khởi nghiệp có đặc điểm gì', 'khởi_nghiệp có đặc_điểm gì', NULL),
(432, 1, 'yếu tố thành công của người khởi nghiệp', 'yếu_tố thành_công của người khởi_nghiệp', NULL),
(433, 1, 'vì sao nên khởi nghiệp', 'vì_sao nên khởi_nghiệp', NULL),
(434, 1, 'vì sao khởi nghiệp thường thất bại', 'vì_sao khởi_nghiệp thường thất_bại', NULL),
(435, 1, 'tại sao mọi người nên khởi nghiệp', 'tại_sao mọi người nên khởi_nghiệp', NULL),
(436, 1, 'cần bao nhiêu tiền để khởi nghiệp', 'cần bao_nhiêu tiền để khởi_nghiệp', NULL),
(437, 1, 'số vốn để bắt đầu khởi nghiệp', 'số vốn để bắt_đầu khởi_nghiệp', NULL),
(438, 1, 'số vốn để bắt đầu khởi nghiệp là bao nhiêu', 'số vốn để bắt_đầu khởi_nghiệp là bao_nhiêu', NULL),
(439, 1, 'tại sao phải nộp thuế tncn', 'tại_sao phải nộp thuế tncn', NULL),
(440, 1, 'đặc điểm của khởi nghiệp', 'đặc_điểm của khởi_nghiệp', NULL),
(441, 1, 'khái niệm khởi nghiệp', 'khái_niệm khởi_nghiệp', NULL),
(442, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(443, 1, 'vì sao phải khởi nghiệp', 'vì_sao phải khởi_nghiệp', NULL),
(444, 1, 'ai có thể khởi nghiệp', 'ai có_thể khởi_nghiệp', NULL),
(445, 1, 'tại sao khởi nghiệp thường thất bại', 'tại_sao khởi_nghiệp thường thất_bại', NULL),
(446, 1, 'khởi nghiệp cần yếu tố gì', 'khởi_nghiệp cần yếu_tố gì', NULL),
(447, 1, 'khi nào nên khởi nghiệp', 'khi_nào nên khởi_nghiệp', NULL),
(448, 1, 'thuế là gì', 'thuế là gì', NULL),
(449, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa là gì', NULL),
(450, 1, 'vì sao phải khởi nghiệp\\', 'vì_sao phải khởi_nghiệp', NULL),
(451, 1, 'vì sao phải khởi nghiệp', 'vì_sao phải khởi_nghiệp', NULL),
(452, 1, 'lí do nên khởi nghiệp là gì', 'lí_do nên khởi_nghiệp là gì', NULL),
(453, 1, 'tại sao phải đóng thuế thu nhập cá nhân', 'tại_sao phải đóng thuế thu_nhập cá_nhân', NULL),
(454, 1, 'vì sao mọi người phải nộp thuế tncn', 'vì_sao mọi người phải nộp thuế tncn', NULL),
(455, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(456, 1, 'cách thức khởi nghiệp', 'cách_thức khởi_nghiệp', NULL),
(457, 1, 'các bước để khởi nghiệp', 'các_bước để khởi_nghiệp', NULL),
(458, 1, 'cách thức để khởi nghiệp', 'cách_thức để khởi_nghiệp', NULL),
(459, 1, 'vì sao nên khởi nghiệp', 'vì_sao nên khởi_nghiệp', NULL),
(460, 1, 'cách để khởi nghiệp', 'cách để khởi_nghiệp', NULL),
(461, 1, 'cách thức khởi nghiệp', 'cách_thức khởi_nghiệp', NULL),
(462, 1, 'cách khởi nghiệp', 'cách khởi_nghiệp', NULL),
(463, 1, 'cách thức để khởi nghiệp', 'cách_thức để khởi_nghiệp', NULL),
(464, 1, 'cách thức để khởi nghiệp', 'cách_thức để khởi_nghiệp', NULL),
(465, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(466, 1, 'có nên khởi nghiệp hay không', 'có_nên khởi_nghiệp hay_không', NULL),
(467, 1, 'có nên khởi nghiệp hay không', 'có_nên khởi_nghiệp hay_không', NULL),
(468, 1, 'có nên khởi nghiệp hay không', 'có_nên khởi_nghiệp hay_không', NULL),
(469, 1, 'có nên khởi nghiệp hay không', 'có_nên khởi_nghiệp hay_không', NULL),
(470, 1, 'có nên khởi nghiệp hay không', 'có_nên khởi_nghiệp hay_không', NULL),
(471, 1, 'bao nhiêu tiền thì có thể khởi nghiệp', 'bao_nhiêu tiền thì_có thể khởi_nghiệp', NULL),
(472, 1, 'bao nhiêu tiền thì có thể khởi nghiệp', 'bao_nhiêu tiền thì_có thể khởi_nghiệp', NULL),
(473, 1, 'số vốn ban đầu để khởi nghiệp', 'số vốn ban_đầu để khởi_nghiệp', NULL),
(474, 1, 'cần bao nhiêu tiền để khởi nghiệp', 'cần bao_nhiêu tiền để khởi_nghiệp', NULL),
(475, 1, 'số vốn ban đầu để khởi nghiệp là bao nhiêu', 'số vốn ban_đầu để khởi_nghiệp là bao_nhiêu', NULL),
(476, 1, 'cần bao nhiêu tiền để bắt đầu khởi nghiệp', 'cần bao_nhiêu tiền để bắt_đầu khởi_nghiệp', NULL),
(477, 1, 'cần bao nhiêu tiền để bắt đầu khởi nghiệp', 'cần bao_nhiêu tiền để bắt_đầu khởi_nghiệp', NULL),
(478, 1, 'cần bao nhiêu tiền để bắt đầu khởi nghiệp', 'cần bao_nhiêu tiền để bắt_đầu khởi_nghiệp', NULL),
(479, 1, 'bao nhiêu tiền để bắt đầu khởi nghiệp', 'bao_nhiêu tiền để bắt_đầu khởi_nghiệp', NULL),
(480, 1, 'cần gì để khởi nghiệp', 'cần gì để khởi_nghiệp', NULL),
(481, 1, 'cần gì để khởi nghiệp', 'cần gì để khởi_nghiệp', NULL),
(482, 1, 'cần bao nhiêu tiền để bắt đầu khởi nghiệp', 'cần bao_nhiêu tiền để bắt_đầu khởi_nghiệp', NULL),
(483, 1, 'bao nhiêu tiền thì có thể khởi nghiệp', 'bao_nhiêu tiền thì_có thể khởi_nghiệp', NULL),
(484, 1, 'cần bao nhiêu tiền thì có thể khởi nghiệp', 'cần bao_nhiêu tiền thì_có thể khởi_nghiệp', NULL),
(485, 1, 'cần bao nhiêu tiền để khởi nghiệp', 'cần bao_nhiêu tiền để khởi_nghiệp', NULL),
(486, 1, 'số tiền ban đầu để khởi nghiệp là bao nhiêu', 'số tiền ban_đầu để khởi_nghiệp là bao_nhiêu', NULL),
(487, 1, 'số vốn khởi nghiệp', 'số vốn khởi_nghiệp', NULL),
(488, 1, 'cách để khởi nghiệp', 'cách để khởi_nghiệp', NULL),
(489, 1, 'quá trình khởi nghiệp như thế nào', 'quá_trình khởi_nghiệp như_thế nào', NULL),
(490, 1, 'tại sao phải nộp thuế tncn', 'tại_sao phải nộp thuế tncn', NULL),
(491, 1, 'vì sao khởi nghiệp hay thất bại', 'vì_sao khởi_nghiệp hay thất_bại', NULL),
(492, 1, 'tại sao phải đóng thuế tncn', 'tại_sao phải đóng thuế tncn', NULL),
(493, 1, 'số tiền để khởi nghiệp', 'số tiền để khởi_nghiệp', NULL),
(494, 1, 'số vốn để khởi nghiệp', 'số vốn để khởi_nghiệp', NULL),
(495, 1, 'cần bao nhiêu vốn để khởi nghiệp', 'cần bao_nhiêu vốn để khởi_nghiệp', NULL),
(496, 1, 'cần gì để khởi nghiệp', 'cần gì để khởi_nghiệp', NULL),
(497, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(498, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(499, 1, 'vì sao phải khởi nghiệp', 'vì_sao phải khởi_nghiệp', NULL),
(500, 1, 'tại sao nên khởi nghiệp', 'tại_sao nên khởi_nghiệp', NULL),
(501, 1, 'tại sao phải nộp thuế thu nhập cá nhân', 'tại_sao phải nộp thuế thu_nhập cá_nhân', NULL),
(502, 1, 'vì sao phải nộp thuế', 'vì_sao phải nộp thuế', NULL),
(503, 1, 'vì sao phải nộp thuế tncn', 'vì_sao phải nộp thuế tncn', NULL),
(504, 1, 'khởi nghiệp có đặc điểm gì', 'khởi_nghiệp có đặc_điểm gì', NULL),
(505, 1, 'quá trình khởi nghiệp như thế nào', 'quá_trình khởi_nghiệp như_thế nào', NULL),
(506, 1, 'các bước để thực hiện khởi nghiệp là gì', 'các_bước để thực_hiện khởi_nghiệp là gì', NULL),
(507, 1, 'tại sao khởi nghiệp thường thất bại', 'tại_sao khởi_nghiệp thường thất_bại', NULL),
(508, 1, 'nguyên nhân khởi nghiệp thất bại là gì', 'nguyên_nhân khởi_nghiệp thất_bại là gì', NULL),
(509, 1, 'nguyên nhân khởi nghiệp thất bại là gì', 'nguyên_nhân khởi_nghiệp thất_bại là gì', NULL),
(510, 1, 'nguyên nhân nào dẫn đến khởi nghiệp thất bại', 'nguyên_nhân nào dẫn đến khởi_nghiệp thất_bại', NULL),
(511, 1, 'nguyên nhân nào dẫn đến khởi nghiệp thất bại', 'nguyên_nhân nào dẫn đến khởi_nghiệp thất_bại', NULL),
(512, 1, 'vì sao khởi nghiệp thường thất bại', 'vì_sao khởi_nghiệp thường thất_bại', NULL),
(513, 1, 'phẩm chất của người khởi nghiệp là gì', 'phẩm_chất của người khởi_nghiệp là gì', NULL),
(514, 1, 'tại sao nên khởi nghiệp', 'tại_sao nên khởi_nghiệp', NULL),
(515, 1, 'mục tiêu của khởi nghiệp là gì', 'mục_tiêu của khởi_nghiệp là gì', NULL),
(516, 1, 'lĩnh vực nào có thể khởi nghiệp', 'lĩnh_vực nào có_thể khởi_nghiệp', NULL),
(517, 1, 'đối tượng nào có thể khởi nghiệp', 'đối_tượng nào có_thể khởi_nghiệp', NULL),
(518, 1, 'ai có thể khởi nghiệp', 'ai có_thể khởi_nghiệp', NULL),
(519, 1, 'số vốn để khởi nghiệp là bao nhiêu', 'số vốn để khởi_nghiệp là bao_nhiêu', NULL),
(520, 1, 'cần bao nhiêu vốn để khởi nghiệp', 'cần bao_nhiêu vốn để khởi_nghiệp', NULL),
(521, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(522, 1, 'chúng ta có nên khởi nghiệp', 'chúng_ta có_nên khởi_nghiệp', NULL),
(523, 1, 'có nên khởi nghiệp hay không', 'có_nên khởi_nghiệp hay_không', NULL),
(524, 1, 'có nên khởi nghiệp', 'có_nên khởi_nghiệp', NULL),
(525, 1, 'vì sao nên khởi nghiệp', 'vì_sao nên khởi_nghiệp', NULL),
(526, 1, 'tại sao phải nộp thuế thu nhập cá nhân', 'tại_sao phải nộp thuế thu_nhập cá_nhân', NULL),
(527, 1, 'vì sao người dân phải đóng thuế tncn', 'vì_sao người dân phải đóng thuế tncn', NULL),
(528, 1, 'tại sao nên khởi nghiệ', 'tại_sao nên khởi nghiệ', NULL),
(529, 1, 'tại sao nên khởi nghiệp', 'tại_sao nên khởi_nghiệp', NULL),
(530, 1, 'Tại sao phải thành lập doanh nghiệp để khởi nghiệp', 'tại_sao phải thành_lập doanh_nghiệp để khởi_nghiệp', NULL),
(531, 1, 'Tại sao khởi nghiệp phải thành lập doanh nghiệp', 'tại_sao khởi_nghiệp phải thành_lập doanh_nghiệp', NULL),
(532, 1, 'Tại sao khởi nghiệp phải thành lập doanh nghiệp', 'tại_sao khởi_nghiệp phải thành_lập doanh_nghiệp', NULL),
(533, 1, 'Tại sao phải thành lập doanh nghiệp để khởi nghiệp', 'tại_sao phải thành_lập doanh_nghiệp để khởi_nghiệp', NULL),
(534, 1, 'tại sao phải thành lập doanh nghiệp', 'tại_sao phải thành_lập doanh_nghiệp', NULL),
(535, 1, 'tại sao kinh doanh phải thành lập doanh nghiệp', 'tại_sao kinh_doanh phải thành_lập doanh_nghiệp', NULL),
(536, 1, 'tại sao phải thành lập doanh nghiệp', 'tại_sao phải thành_lập doanh_nghiệp', NULL),
(537, 1, 'tại sao khởi nghiệp phải thành lập doanh nghiệp', 'tại_sao khởi_nghiệp phải thành_lập doanh_nghiệp', NULL),
(538, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(539, 1, 'mọi người cho mình hỏi cần bao nhiêu tiền để khởi nghiệp', 'mọi người cho mình hỏi cần bao_nhiêu tiền để khởi_nghiệp', NULL),
(540, 1, 'mọi người cho mình hỏi cần bao nhiêu tiền để kinh doanh', 'mọi người cho mình hỏi cần bao_nhiêu tiền để kinh_doanh', NULL),
(541, 1, 'cần bao nhiêu tiền để kinh doanh', 'cần bao_nhiêu tiền để kinh_doanh', NULL),
(542, 1, 'thuế là gì\'', 'thuế là gì', NULL),
(543, 1, 'thuế được định nghĩa là gì', 'thuế được định_nghĩa là gì', NULL),
(544, 1, 'thuế là gì', 'thuế là gì', NULL),
(545, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(546, 1, 'thuế được hiểu như thế nào', 'thuế được hiểu như_thế nào', NULL),
(547, 1, 'tại sao phải nộp thuế tncn', 'tại_sao phải nộp thuế tncn', NULL),
(548, 1, 'thuế tncn là gì', 'thuế tncn là gì', NULL),
(549, 1, 'thuế là gì', 'thuế là gì', NULL),
(550, 1, 'thuế tncn được hiểu như thế nào', 'thuế tncn được hiểu như_thế nào', NULL),
(551, 1, 'tại sao phải nộp thuế tncn', 'tại_sao phải nộp thuế tncn', NULL),
(552, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(553, 1, 'thuế là gì', 'thuế là gì', NULL),
(554, 1, 'thuế tncn là gì', 'thuế tncn là gì', NULL),
(555, 1, 'tại sao phải nộp thuế', 'tại_sao phải nộp thuế', NULL),
(556, 1, 'tại sao phải nộp thuế thu nhập cá nhân', 'tại_sao phải nộp thuế thu_nhập cá_nhân', NULL),
(557, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(558, 1, 'đặc điểm của khởi nghiệp là gì', 'đặc_điểm của khởi_nghiệp là gì', NULL),
(559, 1, 'tôi có nên khởi nghiệp không', 'tôi có_nên khởi_nghiệp không', NULL),
(560, 1, 'vì sao nên khởi nghiệp', 'vì_sao nên khởi_nghiệp', NULL),
(561, 1, 'cần bao nhiêu tiền để khởi nghiệp', 'cần bao_nhiêu tiền để khởi_nghiệp', NULL),
(562, 1, 'khởi nghiệp có đặc điểm gì', 'khởi_nghiệp có đặc_điểm gì', NULL),
(563, 1, 'đặc điểm chung của khởi nghiệp là gì', 'đặc_điểm chung của khởi_nghiệp là gì', NULL),
(564, 1, 'tại sao nên nộp thuế', 'tại_sao nên nộp thuế', NULL),
(565, 1, 'thuế tncn là gì', 'thuế tncn là gì', NULL),
(566, 1, 'thuế là gì', 'thuế là gì', NULL),
(567, 1, 'thuế tncn là igf', 'thuế tncn là igf', NULL),
(568, 1, 'tại sao phải nộp thuế tncn', 'tại_sao phải nộp thuế tncn', NULL),
(569, 1, 'tại sao phải thành lập doanh nghiệp', 'tại_sao phải thành_lập doanh_nghiệp', NULL),
(570, 1, 'tại sao phải nộp thuế tncn', 'tại_sao phải nộp thuế tncn', NULL),
(571, 1, 'thuế là gì', 'thuế là gì', NULL),
(572, 1, 'thuế tncn là gì', 'thuế tncn là gì', NULL),
(573, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(574, 1, 'đặc điểm của khởi nghiệp', 'đặc_điểm của khởi_nghiệp', NULL),
(575, 1, 'tại sao kinh doanh phải thành lập doanh nghiệp', 'tại_sao kinh_doanh phải thành_lập doanh_nghiệp', NULL),
(576, 1, 'tại sao phải nộp thuế tncn', 'tại_sao phải nộp thuế tncn', NULL),
(577, 1, 'thuế tncn là gì', 'thuế tncn là gì', NULL),
(578, 1, 'thuế là gì', 'thuế là gì', NULL),
(579, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(580, 1, 'yếu tố của người khởi nghiệp là gì', 'yếu_tố của người khởi_nghiệp là gì', NULL),
(581, 1, 'các bước để thực hiện khởi nghiệp', 'các_bước để thực_hiện khởi_nghiệp', NULL),
(582, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(583, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(584, 1, 'startup là gì', 'startup là gì', NULL),
(585, 1, 'định nghĩa của startup', 'định_nghĩa của startup', NULL),
(586, 1, 'các bước để thực hiện khởi nghiệp', 'các_bước để thực_hiện khởi_nghiệp', NULL),
(587, 1, 'bao nhiêu tuổi thì có thể khởi nghiệp', 'bao_nhiêu tuổi thì_có thể khởi_nghiệp', NULL),
(588, 1, 'bao nhiêu tuổi thì có thể khởi nghiệp', 'bao_nhiêu tuổi thì_có thể khởi_nghiệp', NULL),
(589, 1, 'người như nào thì có thể khởi nghiệp', 'người như_nào thì_có thể khởi_nghiệp', NULL),
(590, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(591, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(592, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(593, 1, 'đối tượng nào có thể khởi nghiệp', 'đối_tượng nào có_thể khởi_nghiệp', NULL),
(594, 1, 'tại sao kinh doanh phải thành lập doanh nghiệp', 'tại_sao kinh_doanh phải thành_lập doanh_nghiệp', NULL),
(595, 1, 'tại sao khởi nghiệp kinh doanh phải thành lập doanh nghiệp', 'tại_sao khởi_nghiệp kinh_doanh phải thành_lập doanh_nghiệp', NULL),
(596, 1, 'cần bao nhiêu tiền để có thể khởi nghiệp', 'cần bao_nhiêu tiền để có_thể khởi_nghiệp', NULL),
(597, 1, 'abc', 'abc', NULL),
(598, 1, 'cần bao nhiêu tiền để có thể khởi nghiệp', 'cần bao_nhiêu tiền để có_thể khởi_nghiệp', NULL),
(599, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa là gì', NULL),
(600, 1, 'startup là gì', 'startup là gì', NULL),
(601, 1, 'start up là gì', 'start_up là gì', NULL),
(602, 1, 'quá trình để khởi nghiệp như thế nào', 'quá_trình để khởi_nghiệp như_thế nào', NULL),
(603, 1, 'các bước để tôi có thể bắt đầu khởi nghiệp\\', 'các_bước để tôi có_thể bắt_đầu khởi_nghiệp', NULL),
(604, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(605, 1, 'thuế là gì', 'thuế là gì', NULL),
(606, 1, 'tại sao kinh doanh cần thành lập doanh nghiệp', 'tại_sao kinh_doanh cần thành_lập doanh_nghiệp', NULL),
(607, 1, 'thuế tncn là gì', 'thuế tncn là gì', NULL),
(608, 1, 'cần bao nhiêu tiền để có thể khởi nghiệp', 'cần bao_nhiêu tiền để có_thể khởi_nghiệp', NULL),
(609, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa là gì', NULL),
(610, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(611, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(612, 1, 'vì sao phải khởi nghiệp', 'vì_sao phải khởi_nghiệp', NULL),
(613, 1, 'quá trình để khởi nghiệp như thế nào', 'quá_trình để khởi_nghiệp như_thế nào', NULL),
(614, 1, 'các bước để tôi có thể khởi nghiệp', 'các_bước để tôi có_thể khởi_nghiệp', NULL),
(615, 1, 'các bước để khởi nghiệp', 'các_bước để khởi_nghiệp', NULL),
(616, 1, 'các bước để khởi nghiệp là gì', 'các_bước để khởi_nghiệp là gì', NULL),
(617, 1, 'bắt đầu khởi nghiệp cầng fi', 'bắt_đầu khởi_nghiệp cầng fi', NULL),
(618, 1, 'bắt đầu khởi nghiệp cầng gì', 'bắt_đầu khởi_nghiệp cầng gì', NULL),
(619, 1, 'bắt đầu khởi nghiệp cần những yếu tố nào', 'bắt_đầu khởi_nghiệp cần những yếu_tố nào', NULL),
(620, 1, 'các bước để có thể khởi nghiệp', 'các_bước để có_thể khởi_nghiệp', NULL),
(621, 1, 'các bước để khởi nghiệo', 'các_bước để khởi nghiệo', NULL),
(622, 1, 'các bước để khởi nghiệp', 'các_bước để khởi_nghiệp', NULL),
(623, 1, 'làm sao để khởi nghiệp', 'làm_sao để khởi_nghiệp', NULL),
(624, 1, 'các bước để bắt đầu khởi nghiệp', 'các_bước để bắt_đầu khởi_nghiệp', NULL),
(625, 1, 'các bước để có thể khởi nghiệp', 'các_bước để có_thể khởi_nghiệp', NULL),
(626, 1, 'các bước để có thể khởi nghiệp', 'các_bước để có_thể khởi_nghiệp', NULL),
(627, 1, 'các bước để có thể khởi nghiệp', 'các_bước để có_thể khởi_nghiệp', NULL),
(628, 1, 'các bước để tôi có thể bắt đầu khởi nghiệp', 'các_bước để tôi có_thể bắt_đầu khởi_nghiệp', NULL),
(629, 1, 'các bước để tôi có thể bắt đầu khởi nghiệp là gì', 'các_bước để tôi có_thể bắt_đầu khởi_nghiệp là gì', NULL),
(630, 1, 'cách thức để khởi nghiệp', 'cách_thức để khởi_nghiệp', NULL),
(631, 1, 'cách thức để tôi khởi nghiệp', 'cách_thức để tôi khởi_nghiệp', NULL),
(632, 1, 'cách thức để tôi có thể khởi nghiệp', 'cách_thức để tôi có_thể khởi_nghiệp', NULL),
(633, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(634, 1, 'vì sao phải khởi nghiệp', 'vì_sao phải khởi_nghiệp', NULL),
(635, 1, 'định nghĩa về khởi nghiệp', 'định_nghĩa về khởi_nghiệp', NULL),
(636, 1, 'định nghĩa về startup', 'định_nghĩa về startup', NULL),
(637, 1, 'khởi nghiệp có đặc điểm gì', 'khởi_nghiệp có đặc_điểm gì', NULL),
(638, 1, 'tại sao nên khởi nghiệp', 'tại_sao nên khởi_nghiệp', NULL),
(639, 1, 'yếu tố khởi nghiệp thành công là gì', 'yếu_tố khởi_nghiệp thành_công là gì', NULL),
(640, 1, 'yếu tố khởi của người khởi nghiệp là gi', 'yếu_tố khởi của người khởi_nghiệp là gi', NULL),
(641, 1, 'người khởi nghiệp cần có yếu tố gì', 'người khởi_nghiệp cần có yếu_tố gì', NULL),
(642, 1, 'thuế là gì', 'thuế là gì', NULL),
(643, 1, 'thuế tncn là gì', 'thuế tncn là gì', NULL),
(644, 1, 'tại sao tôi lại phải nộp thuế tncn', 'tại_sao tôi lại phải nộp thuế tncn', NULL),
(645, 1, 'vì sao mọi người phải nộp thuế tncn', 'vì_sao mọi người phải nộp thuế tncn', NULL),
(646, 1, 'cần bao nhiêu tiền thì có thể khởi nghiệp', 'cần bao_nhiêu tiền thì_có thể khởi_nghiệp', NULL),
(647, 1, 'tại sao tôi nên khởi nghiệp', 'tại_sao tôi nên khởi_nghiệp', NULL),
(648, 1, 'tại sao khởi nghiệp hay thất bại', 'tại_sao khởi_nghiệp hay thất_bại', NULL),
(649, 1, 'có nên khởi nghiệp hay không', 'có_nên khởi_nghiệp hay_không', NULL),
(650, 1, 'có nên khởi nghiệp', 'có_nên khởi_nghiệp', NULL),
(651, 1, 'có nên khởi nghiệp hay không', 'có_nên khởi_nghiệp hay_không', NULL),
(652, 1, 'có nên khởi nghiệp hay không', 'có_nên khởi_nghiệp hay_không', NULL),
(653, 1, 'có nên khởi nghiệp hay không', 'có_nên khởi_nghiệp hay_không', NULL),
(654, 1, 'có cần thiết để khởi nghiệp hay không', 'có cần_thiết để khởi_nghiệp hay_không', NULL),
(655, 1, 'có cần thiết để khởi nghiệp hay không', 'có cần_thiết để khởi_nghiệp hay_không', NULL),
(656, 1, 'có cần thiết để khởi nghiệp hay không', 'có cần_thiết để khởi_nghiệp hay_không', NULL),
(657, 1, 'lí do gì để khởi nghiệp', 'lí_do gì để khởi_nghiệp', NULL),
(658, 1, 'có cần thiết khởi nghiệp hay không', 'có cần_thiết khởi_nghiệp hay_không', NULL),
(659, 1, 'có cần thiết để khởi nghiệp hay không', 'có cần_thiết để khởi_nghiệp hay_không', NULL),
(660, 1, 'khởi nghiệp hay không', 'khởi_nghiệp hay_không', NULL);
INSERT INTO `question_user` (`id`, `id_user`, `question`, `question_tokenizer`, `feature`) VALUES
(661, 1, 'có nên khởi nghiệp hay không', 'có_nên khởi_nghiệp hay_không', NULL),
(662, 1, 'khởi nghiệp có lợi ích gì', 'khởi_nghiệp có_lợi ích gì', NULL),
(663, 1, 'có nên khởi nghiệp không', 'có_nên khởi_nghiệp không', NULL),
(664, 1, 'có nên khởi nghiệp không', 'có_nên khởi_nghiệp không', NULL),
(665, 1, 'tại sao nên khởi nghiệp', 'tại_sao nên khởi_nghiệp', NULL),
(666, 1, 'mục tiêu của khởi nghiệp là gì', 'mục_tiêu của khởi_nghiệp là gì', NULL),
(667, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(668, 1, 'tại sao chúng ta phải nộp thuế tncn', 'tại_sao chúng_ta phải nộp thuế tncn', NULL),
(669, 1, 'số vốn ban đầu để khởi nghiệp là bao nhiêu', 'số vốn ban_đầu để khởi_nghiệp là bao_nhiêu', NULL),
(670, 1, 'số vốn ban đầu cần để khởi nghiệp là bao nhiêu', 'số vốn ban_đầu cần để khởi_nghiệp là bao_nhiêu', NULL),
(671, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(672, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(673, 1, 'startup là gì', 'startup là gì', NULL),
(674, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(675, 1, 'startup là gì', 'startup là gì', NULL),
(676, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(677, 1, 'khởi nghiệp', 'khởi_nghiệp', NULL),
(678, 1, 'định nghĩa khởi nghiệp', 'định_nghĩa khởi_nghiệp', NULL),
(679, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(680, 1, 'startup là gì', 'startup là gì', NULL),
(681, 1, 'định nghĩa về khởi nghiệp', 'định_nghĩa về khởi_nghiệp', NULL),
(682, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(683, 1, 'cần gì để khởi nghiệp', 'cần gì để khởi_nghiệp', NULL),
(684, 1, 'quá trình để bắt đầu khởi nghiệp', 'quá_trình để bắt_đầu khởi_nghiệp', NULL),
(685, 1, 'thuế là gì', 'thuế là gì', NULL),
(686, 1, 'thuế tncn là gì', 'thuế tncn là gì', NULL),
(687, 1, 'có nên khởi nghiệp hay không', 'có_nên khởi_nghiệp hay_không', NULL),
(688, 1, 'tại sao nên khởi nghiệp', 'tại_sao nên khởi_nghiệp', NULL),
(689, 1, 'đặc điểm của khởi nghiệp', 'đặc_điểm của khởi_nghiệp', NULL),
(690, 1, 'tại sao phải nộp thuế tncn', 'tại_sao phải nộp thuế tncn', NULL),
(691, 1, 'vì sao nên khởi nghiệp', 'vì_sao nên khởi_nghiệp', NULL),
(692, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(693, 1, 'định nghĩa của khởi nghiệp', 'định_nghĩa của khởi_nghiệp', NULL),
(694, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(695, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(696, 1, 'vì sao phải khởi nghiệp', 'vì_sao phải khởi_nghiệp', NULL),
(697, 1, 'vì sao phải khởi nghiệp', 'vì_sao phải khởi_nghiệp', NULL),
(698, 1, 'vì sao phải khởi nghiệp', 'vì_sao phải khởi_nghiệp', NULL),
(699, 1, 'vì sao phải khởi nghiệp', 'vì_sao phải khởi_nghiệp', NULL),
(700, 1, 'vì sao phải khởi nghiệp', 'vì_sao phải khởi_nghiệp', NULL),
(701, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(702, 1, 'k', 'k', NULL),
(703, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(704, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(705, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(706, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(707, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(708, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(709, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(710, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(711, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(712, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(713, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(714, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(715, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(716, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(717, 1, 'định nghĩa của khởi nghiệp', 'định_nghĩa của khởi_nghiệp', NULL),
(718, 1, 'định nghĩa của khởi nghiệp', 'định_nghĩa của khởi_nghiệp', NULL),
(719, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(720, 1, 'khởi nghiệp nghĩa là gì', 'khởi_nghiệp nghĩa_là gì', NULL),
(721, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(722, 1, 'vì sao nên khởi nghiệp', 'vì_sao nên khởi_nghiệp', NULL),
(723, 1, 'tại sao chúng ta phải khởi nghiệp', 'tại_sao chúng_ta phải khởi_nghiệp', NULL),
(724, 1, 'đặc điểm của khởi nghiệp', 'đặc_điểm của khởi_nghiệp', NULL),
(725, 1, 'đặc điểm của khởi nghiệp', 'đặc_điểm của khởi_nghiệp', NULL),
(726, 1, 'đặc điểm của khởi nghiệp', 'đặc_điểm của khởi_nghiệp', NULL),
(727, 1, 'đặc điểm của khởi nghiệp', 'đặc_điểm của khởi_nghiệp', NULL),
(728, 1, 'tại sao nên khởi nghiệp', 'tại_sao nên khởi_nghiệp', NULL),
(729, 1, 'lí do dể khởi nghiệp', 'lí_do dể khởi_nghiệp', NULL),
(730, 1, 'thuế là gì', 'thuế là gì', NULL),
(731, 1, 'thuế tncn là gì', 'thuế tncn là gì', NULL),
(732, 1, 'tại sao phải nộp thuế tncn', 'tại_sao phải nộp thuế tncn', NULL),
(733, 1, 'khởi nghiệp có đặc điểm gì', 'khởi_nghiệp có đặc_điểm gì', NULL),
(734, 1, 'khởi nghiệp có đặc điểm gì', 'khởi_nghiệp có đặc_điểm gì', NULL),
(735, 1, 'đặc điểm của khởi nghiệp là ì', 'đặc_điểm của khởi_nghiệp là ì', NULL),
(736, 1, 'đặc điểm của khởi nghiệp là gì', 'đặc_điểm của khởi_nghiệp là gì', NULL),
(737, 1, 'đặc điểm của khởi nghiệp', 'đặc_điểm của khởi_nghiệp', NULL),
(738, 1, 'đặc điểm của khởi nghiệp là', 'đặc_điểm của khởi_nghiệp là', NULL),
(739, 1, 'đặc điểm của khởi nghiệp là gì', 'đặc_điểm của khởi_nghiệp là gì', NULL),
(740, 1, 'các bước để khởi nghiệp', 'các_bước để khởi_nghiệp', NULL),
(741, 1, 'các bước để khởi nghiệp', 'các_bước để khởi_nghiệp', NULL),
(742, 1, 'quá trình để khỏi nghiệp', 'quá_trình để khỏi nghiệp', NULL),
(743, 1, 'quá trình để khỏi nghiệp', 'quá_trình để khỏi nghiệp', NULL),
(744, 1, 'các bước để khởi nghiệp', 'các_bước để khởi_nghiệp', NULL),
(745, 1, 'các bước để khởi nghiệp', 'các_bước để khởi_nghiệp', NULL),
(746, 1, 'các bước để khởi nghiệp', 'các_bước để khởi_nghiệp', NULL),
(747, 1, 'quá trình để khởi nghiệp', 'quá_trình để khởi_nghiệp', NULL),
(748, 1, 'quá trình để khởi nghiệp', 'quá_trình để khởi_nghiệp', NULL),
(749, 1, 'quá trình để khởi nghiệp', 'quá_trình để khởi_nghiệp', NULL),
(750, 1, 'quá trình để khởi nghiệp', 'quá_trình để khởi_nghiệp', NULL),
(751, 1, 'quá trình để khởi nghiệp', 'quá_trình để khởi_nghiệp', NULL),
(752, 1, 'quá trình để khởi nghiệp', 'quá_trình để khởi_nghiệp', NULL),
(753, 1, 'quá trình để khởi nghiệp', 'quá_trình để khởi_nghiệp', NULL),
(754, 1, 'quá trình khởi nghiệp', 'quá_trình khởi_nghiệp', NULL),
(755, 1, 'các bước để khởi nghiệp', 'các_bước để khởi_nghiệp', NULL),
(756, 1, 'vì sao phải khởi nghiệp', 'vì_sao phải khởi_nghiệp', NULL),
(757, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(758, 1, 'vì sao phải khởi nghiệp', 'vì_sao phải khởi_nghiệp', NULL),
(759, 1, 'thuế là gì', 'thuế là gì', NULL),
(760, 1, 'thuế tncn là gì', 'thuế tncn là gì', NULL),
(761, 1, 'tại sao phải nộp thuế', 'tại_sao phải nộp thuế', NULL),
(762, 1, 'tại sao phải nộp thuế tncn', 'tại_sao phải nộp thuế tncn', NULL),
(763, 1, 'cần bao nhiêu vốn để khởi nghiệp', 'cần bao_nhiêu vốn để khởi_nghiệp', NULL),
(764, 1, 'bao nhiêu tiền thì có thể khởi nghiệp', 'bao_nhiêu tiền thì_có thể khởi_nghiệp', NULL),
(765, 1, 'tại sao kinh doanh phải thành lập doanh nghiệp', 'tại_sao kinh_doanh phải thành_lập doanh_nghiệp', NULL),
(766, 1, 'kinh doanh có phải thành lập doanh nghiệp không', 'kinh_doanh có_phải thành_lập doanh_nghiệp không', NULL),
(767, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(768, 1, 'startup là gì', 'startup là gì', NULL),
(769, 1, 'vì sao nên khởi nghiệp', 'vì_sao nên khởi_nghiệp', NULL),
(770, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(771, 1, 'tại sao chúng ta nên khởi nghiệ[', 'tại_sao chúng_ta nên khởi nghiệ', NULL),
(772, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(773, 1, 'tôi cần bao nhiêu tiền để có thể khởi nghiệp', 'tôi cần bao_nhiêu tiền để có_thể khởi_nghiệp', NULL),
(774, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(775, 1, 'thuế là gì', 'thuế là gì', NULL),
(776, 1, 'thuế tncn là gì', 'thuế tncn là gì', NULL),
(777, 1, 'thuế thu nhập cá nhân là gì', 'thuế thu_nhập cá_nhân là gì', NULL),
(778, 1, 'tại sao phải nộp thuế tncn', 'tại_sao phải nộp thuế tncn', NULL),
(779, 1, 'tôi muốn khởi nghiệp nhưng không biết bắt đầu từ đâu', 'tôi muốn khởi_nghiệp nhưng không biết bắt_đầu từ đâu', NULL),
(780, 1, 'tôi muốn khởi nghiệp nhưng không biết bắt đầu từ đâu', 'tôi muốn khởi_nghiệp nhưng không biết bắt_đầu từ đâu', NULL),
(781, 1, 'tôi muốn khởi nghiệp nhưng không biết bắt đầu từ đâu', 'tôi muốn khởi_nghiệp nhưng không biết bắt_đầu từ đâu', NULL),
(782, 1, 'tôi muốn khởi nghiệp nhưng không biết bắt đầu từ đâu', 'tôi muốn khởi_nghiệp nhưng không biết bắt_đầu từ đâu', NULL),
(783, 1, 'khởi nghiệp', 'khởi_nghiệp', NULL),
(784, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(785, 1, 'hãy nêu định nghĩa khởi nghiệp', 'hãy nêu định_nghĩa khởi_nghiệp', NULL),
(786, 1, 'hãy nêu về định nghĩa khởi nghiệp', 'hãy nêu về định_nghĩa khởi_nghiệp', NULL),
(787, 1, 'hãy nêu về định nghĩa khởi nghiệp', 'hãy nêu về định_nghĩa khởi_nghiệp', NULL),
(788, 1, 'hãy nêu về định nghĩa khởi nghiệp', 'hãy nêu về định_nghĩa khởi_nghiệp', NULL),
(789, 1, 'khởi nghiệp', 'khởi_nghiệp', NULL),
(790, 1, 'khởi nghiệp', 'khởi_nghiệp', NULL),
(791, 1, 'định nghĩa về khởi nghiệp', 'định_nghĩa về khởi_nghiệp', NULL),
(792, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(793, 1, 'khởi nghiệp', 'khởi_nghiệp', NULL),
(794, 1, 'hãy nêu định nghĩa về khởi nghiệp', 'hãy nêu định_nghĩa về khởi_nghiệp', NULL),
(795, 1, 'startup là gì', 'startup là gì', NULL),
(796, 1, 'định nghĩa startup', 'định_nghĩa startup', NULL),
(797, 1, 'định nghĩa start up', 'định_nghĩa start_up', NULL),
(798, 1, 'vì sao nên khởi nghiệp', 'vì_sao nên khởi_nghiệp', NULL),
(799, 1, 'khởi nghiệp định nghĩa', 'khởi_nghiệp định_nghĩa', NULL),
(800, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(801, 1, 'các bước để tiến hành khởi nghiệp', 'các_bước để tiến_hành khởi_nghiệp', NULL),
(802, 1, 'tôi muốn khởi nghiệp nhưng không biết bắt đầu từ đâu', 'tôi muốn khởi_nghiệp nhưng không biết bắt_đầu từ đâu', NULL),
(803, 1, 'các ngành nghề để khởi nghiệp', 'các ngành_nghề để khởi_nghiệp', NULL),
(804, 1, 'các ngành để khởi nghiệp', 'các ngành để khởi_nghiệp', NULL),
(805, 1, 'các lĩnh vực để khởi nghiệp', 'các lĩnh_vực để khởi_nghiệp', NULL),
(806, 1, 'các ngành nghề để khởi nghiệp', 'các ngành_nghề để khởi_nghiệp', NULL),
(807, 1, 'các ngành để khởi nghiệp', 'các ngành để khởi_nghiệp', NULL),
(808, 1, 'các ngành để khởi nghiệp', 'các ngành để khởi_nghiệp', NULL),
(809, 1, 'các ngành để khởi nghiệp', 'các ngành để khởi_nghiệp', NULL),
(810, 1, 'các ngành để khởi nghiệp', 'các ngành để khởi_nghiệp', NULL),
(811, 1, 'các ngành để khởi nghiệp', 'các ngành để khởi_nghiệp', NULL),
(812, 1, 'các nghề có thể khởi nghiệp', 'các nghề có_thể khởi_nghiệp', NULL),
(813, 1, 'các nghề có thể khởi nghiệp', 'các nghề có_thể khởi_nghiệp', NULL),
(814, 1, 'bắt đầu kinh doanh cần yếu tố gì', 'bắt_đầu kinh_doanh cần yếu_tố gì', NULL),
(815, 1, 'bắt đầu kinh doanh cần yếu tố gì', 'bắt_đầu kinh_doanh cần yếu_tố gì', NULL),
(816, 1, 'bắt đầu kinh doanh cần yếu tố gì', 'bắt_đầu kinh_doanh cần yếu_tố gì', NULL),
(817, 1, 'người kinh doanh cần những yếu tố gì', 'người_kinh doanh cần những yếu_tố gì', NULL),
(818, 1, 'người kinh doanh cần những yếu tố gì', 'người_kinh doanh cần những yếu_tố gì', NULL),
(819, 1, 'người kinh doanh cần những yếu tố gì', 'người_kinh doanh cần những yếu_tố gì', NULL),
(820, 1, 'người khởi nghiệp cần những yếu tố gì', 'người khởi_nghiệp cần những yếu_tố gì', NULL),
(821, 1, 'người khởi nghiệp cần những yếu tố gì', 'người khởi_nghiệp cần những yếu_tố gì', NULL),
(822, 1, 'vì sao nên khởi nghiệp', 'vì_sao nên khởi_nghiệp', NULL),
(823, 1, 'lí do để khởi nghiệp là gì', 'lí_do để khởi_nghiệp là gì', NULL),
(824, 1, 'thuế là gì', 'thuế là gì', NULL),
(825, 1, 'tại sao khởi nghiệp hay thất bại', 'tại_sao khởi_nghiệp hay thất_bại', NULL),
(826, 1, 'vì sao chúng ta không nên khởi nghiệp', 'vì_sao chúng_ta không nên khởi_nghiệp', NULL),
(827, 1, 'kinh doanh', 'kinh_doanh', NULL),
(828, 1, 'khởi nghiệp', 'khởi_nghiệp', NULL),
(829, 1, 'thuế', 'thuế', NULL),
(830, 1, 'thuế tncn', 'thuế tncn', NULL),
(831, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(832, 1, 'startup là gì', 'startup là gì', NULL),
(833, 1, 'bắt đầu khởi nghiệp cần những gì', 'bắt_đầu khởi_nghiệp cần những gì', NULL),
(834, 1, 'quá trình để khởi nghiệp', 'quá_trình để khởi_nghiệp', NULL),
(835, 1, 'để bắt đầu khởi nghiệp cần bắt đầu từ đâu', 'để bắt_đầu khởi_nghiệp cần bắt_đầu từ đâu', NULL),
(836, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(837, 1, 'vì sao nên khởi nghiệp', 'vì_sao nên khởi_nghiệp', NULL),
(838, 1, 'đặc điểm của khởi nghiệp', 'đặc_điểm của khởi_nghiệp', NULL),
(839, 1, 'khởi nghiệp có đặc điểm gì', 'khởi_nghiệp có đặc_điểm gì', NULL),
(840, 1, 'tại sao chúng ta nên khởi ngiệp', 'tại_sao chúng_ta nên khởi ngiệp', NULL),
(841, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(842, 1, 'vì sao phải khởi nghiệp', 'vì_sao phải khởi_nghiệp', NULL),
(843, 1, 'tại sao nên khởi nghiệp', 'tại_sao nên khởi_nghiệp', NULL),
(844, 1, 'chúng tôi muốn khởi nghiệp', 'chúng_tôi muốn khởi_nghiệp', NULL),
(845, 1, 'cần bao nhiêu tiền để khởi nghiệp', 'cần bao_nhiêu tiền để khởi_nghiệp', NULL),
(846, 1, 'vốn bao nhiêu thì có thể khởi nghiệo', 'vốn bao_nhiêu thì_có thể khởi nghiệo', NULL),
(847, 1, 'vốn bao nhiêu thì có thể khởi nghiệp', 'vốn bao_nhiêu thì_có thể khởi_nghiệp', NULL),
(848, 1, 'tại sao khởi nghiệp phải thành lập doanh nghiệ[', 'tại_sao khởi_nghiệp phải thành_lập doanh nghiệ', NULL),
(849, 1, 'tại sao khởi nghiệp phải thành lập doanh nghiệp', 'tại_sao khởi_nghiệp phải thành_lập doanh_nghiệp', NULL),
(850, 1, 'tôi muốn khởi nghiệp nhưng không biết bắt đầu từ đâu', 'tôi muốn khởi_nghiệp nhưng không biết bắt_đầu từ đâu', NULL),
(851, 1, 'tôi muốn khởi nghiệp nhưng không biết bắt đầu từ đâu', 'tôi muốn khởi_nghiệp nhưng không biết bắt_đầu từ đâu', NULL),
(852, 1, 'có nên khởi nghiệp không', 'có_nên khởi_nghiệp không', NULL),
(853, 1, 'chúng ta sao phải khởi nghiệp', 'chúng_ta sao phải khởi_nghiệp', NULL),
(854, 1, 'quá trình khởi nghiệp', 'quá_trình khởi_nghiệp', NULL),
(855, 1, 'vì sao chúng ta nên khởi nghiệp', 'vì_sao chúng_ta nên khởi_nghiệp', NULL),
(856, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(857, 1, 'startup là gì', 'startup là gì', NULL),
(858, 1, 'startup-up là gì', 'startupup là gì', NULL),
(859, 1, 'startup-up là gì', 'startupup là gì', NULL),
(860, 1, 'start-up là gì', 'startup là gì', NULL),
(861, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(862, 1, 'vì sao nên khởi nghiệp', 'vì_sao nên khởi_nghiệp', NULL),
(863, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(864, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(865, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(866, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(867, 1, 'start up là gì', 'start_up là gì', NULL),
(868, 1, 'tại sao nên khởi nghiệp', 'tại_sao nên khởi_nghiệp', NULL),
(869, 1, 'vì sao chúng ta nên khởi nghiệp', 'vì_sao chúng_ta nên khởi_nghiệp', NULL),
(870, 1, 'tôi muốn khởi nghiệp nhưng không biết bắt đầu từ đâu', 'tôi muốn khởi_nghiệp nhưng không biết bắt_đầu từ đâu', NULL),
(871, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(872, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(873, 1, 'startup là gì', 'startup là gì', NULL),
(874, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(875, 1, 'vì sao nên khởi nghiệp', 'vì_sao nên khởi_nghiệp', NULL),
(876, 1, 'tại sao chúng ta phải khởi nghiệp', 'tại_sao chúng_ta phải khởi_nghiệp', NULL),
(877, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(878, 1, 'vì sao khởi nghiệp', 'vì_sao khởi_nghiệp', NULL),
(879, 1, 'cần bao nhiêu tiền để có thể khởi nghiệp', 'cần bao_nhiêu tiền để có_thể khởi_nghiệp', NULL),
(880, 1, 'có nên khởi nghiệp không', 'có_nên khởi_nghiệp không', NULL),
(881, 1, 'thuế là gì', 'thuế là gì', NULL),
(882, 1, 'thuế tncn là gì', 'thuế tncn là gì', NULL),
(883, 1, 'tại sao phải nộp thuế', 'tại_sao phải nộp thuế', NULL),
(884, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(885, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(886, 1, 'startup là gì', 'startup là gì', NULL),
(887, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(888, 1, 'khởi nghiệp được hiểu là gì', 'khởi_nghiệp được hiểu là gì', NULL),
(889, 1, 'vì sao nên khởi nghiệp', 'vì_sao nên khởi_nghiệp', NULL),
(890, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(891, 1, 'có nên khởi nghiệp không', 'có_nên khởi_nghiệp không', NULL),
(892, 1, 'tại sao khởi nghiệp phải thành lập doanh nghiệp', 'tại_sao khởi_nghiệp phải thành_lập doanh_nghiệp', NULL),
(893, 1, 'khởi nghiệp có phải thành lập doanh nghiệp không', 'khởi_nghiệp có_phải thành_lập doanh_nghiệp không', NULL),
(894, 1, 'các bước để khởi nghiệp', 'các_bước để khởi_nghiệp', NULL),
(895, 1, 'tôi muốn khởi nghiệp nhưng không biết bắt đầu từ đâu', 'tôi muốn khởi_nghiệp nhưng không biết bắt_đầu từ đâu', NULL),
(896, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(897, 1, 'tại sao khởi nghiệp thường thất bại', 'tại_sao khởi_nghiệp thường thất_bại', NULL),
(898, 1, 'vì sao thất bại khi khởi nghiệp', 'vì_sao thất_bại khi khởi_nghiệp', NULL),
(899, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(900, 1, 'startup là gì', 'startup là gì', NULL),
(901, 1, 'vì sao nên khởi nghiệp', 'vì_sao nên khởi_nghiệp', NULL),
(902, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(903, 1, 'có nên khởi nghiệp không', 'có_nên khởi_nghiệp không', NULL),
(904, 1, 'tôi muốn khởi nghiệp nhưng không biết bắt đầu từ đâu', 'tôi muốn khởi_nghiệp nhưng không biết bắt_đầu từ đâu', NULL),
(905, 1, 'các bước để tôi bắt đầu khởi nghiệp', 'các_bước để tôi bắt_đầu khởi_nghiệp', NULL),
(906, 1, 'tôi cần bao nhiêu tiền để bắt đầu khởi nghiệp', 'tôi cần bao_nhiêu tiền để bắt_đầu khởi_nghiệp', NULL),
(907, 1, 'vậy tôi cần bao nhiêu tiền để có thể khởi nghiệp', 'vậy tôi cần bao_nhiêu tiền để có_thể khởi_nghiệp', NULL),
(908, 1, 'làm thế nào để khởi nghiệp', 'làm thế_nào để khởi_nghiệp', NULL),
(909, 1, 'vậy tôi cần bao nhiêu tiền để khởi nghiệp', 'vậy tôi cần bao_nhiêu tiền để khởi_nghiệp', NULL),
(910, 1, 'tại sao khởi nghiệp phải thành lập doanh nghiệp', 'tại_sao khởi_nghiệp phải thành_lập doanh_nghiệp', NULL),
(911, 1, 'các bước để tôi bắt đầu khởi nghiệp', 'các_bước để tôi bắt_đầu khởi_nghiệp', NULL),
(912, 1, 'tôi muốn khởi nghiệp nhưng không biết bắt đầu từ đâu', 'tôi muốn khởi_nghiệp nhưng không biết bắt_đầu từ đâu', NULL),
(913, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(914, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(915, 1, 'startup là gì', 'startup là gì', NULL),
(916, 1, 'vì sao nên khởi nghiệp', 'vì_sao nên khởi_nghiệp', NULL),
(917, 1, 'có nên khởi nghiệp không', 'có_nên khởi_nghiệp không', NULL),
(918, 1, 'thuế là gì', 'thuế là gì', NULL),
(919, 1, 'thuế tncn là gì', 'thuế tncn là gì', NULL),
(920, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(921, 1, 'vì sao nên khởi nghiệp', 'vì_sao nên khởi_nghiệp', NULL),
(922, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(923, 1, 'tại sao khởi nghiệp phải thành lập doanh nghiệp', 'tại_sao khởi_nghiệp phải thành_lập doanh_nghiệp', NULL),
(924, 1, 'cần bao nhiêu tiền để khởi nghiệp', 'cần bao_nhiêu tiền để khởi_nghiệp', NULL),
(925, 1, 'tôi muốn khởi nghiệp nhưng không biết bắt đầu từ đâu', 'tôi muốn khởi_nghiệp nhưng không biết bắt_đầu từ đâu', NULL),
(926, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(927, 1, 'startup là gì', 'startup là gì', NULL),
(928, 1, 'vì sao phải khởi nghiệp', 'vì_sao phải khởi_nghiệp', NULL),
(929, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(930, 1, 'có nên khởi nghiệp hay không', 'có_nên khởi_nghiệp hay_không', NULL),
(931, 1, 'có nên khởi nghiệp không', 'có_nên khởi_nghiệp không', NULL),
(932, 1, 'chúng ta có nên khởi nghiệp', 'chúng_ta có_nên khởi_nghiệp', NULL),
(933, 1, 'có nên khởi nghiệp hay không', 'có_nên khởi_nghiệp hay_không', NULL),
(934, 1, 'có nên khởi nghiệp hay không', 'có_nên khởi_nghiệp hay_không', NULL),
(935, 1, 'có nên khởi nghiệp hay không', 'có_nên khởi_nghiệp hay_không', NULL),
(936, 1, 'có nên khởi nghiệp không', 'có_nên khởi_nghiệp không', NULL),
(937, 1, 'chúng ta có nên khởi nghiệp', 'chúng_ta có_nên khởi_nghiệp', NULL),
(938, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(939, 1, 'tại sao chúng ta nên khởi nghiệp\\', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(940, 1, 'vì sao nên khởi nghiệp', 'vì_sao nên khởi_nghiệp', NULL),
(941, 1, 'các bước để tôi khởi nghiệp là gì', 'các_bước để tôi khởi_nghiệp là gì', NULL),
(942, 1, 'tôi muốn khởi nghiệp nhưng không biết bắt đầu từ đâu', 'tôi muốn khởi_nghiệp nhưng không biết bắt_đầu từ đâu', NULL),
(943, 1, 'tôi cần bao nhiêu tiền để bắt đầu khởi nghiệp', 'tôi cần bao_nhiêu tiền để bắt_đầu khởi_nghiệp', NULL),
(944, 1, 'tại sao khởi nghiệp hay thất bại', 'tại_sao khởi_nghiệp hay thất_bại', NULL),
(945, 1, 'bao nhiêu vốn để bắt đầu khởi nghiệp', 'bao_nhiêu vốn để bắt_đầu khởi_nghiệp', NULL),
(946, 1, 'khởi nghiệp', 'khởi_nghiệp', NULL),
(947, 1, 'abc', 'abc', NULL),
(948, 1, 'akakskd', 'akakskd', NULL),
(949, 1, 'ád', 'ád', NULL),
(950, 1, 'ád', 'ád', NULL),
(951, 1, 'd', 'd', NULL),
(952, 1, 'tại sao nên khởi nghiệp', 'tại_sao nên khởi_nghiệp', NULL),
(953, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(954, 1, 'startup là gì', 'startup là gì', NULL),
(955, 1, 'vì sao nên khởi nghiệp', 'vì_sao nên khởi_nghiệp', NULL),
(956, 1, 'tại sao chúng ta nên khởi nghiệp', 'tại_sao chúng_ta nên khởi_nghiệp', NULL),
(957, 1, 'các bước để tôi khởi nghiệp', 'các_bước để tôi khởi_nghiệp', NULL),
(958, 1, 'tôi muốn khởi nghiệp nhưng không biết bắt đầu từ đâu', 'tôi muốn khởi_nghiệp nhưng không biết bắt_đầu từ đâu', NULL),
(959, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(960, 1, 'startup là gì', 'startup là gì', NULL),
(961, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(962, 1, 'startup là gì', 'startup là gì', NULL),
(963, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(964, 1, 'startup là gì', 'startup là gì', NULL),
(965, 1, 'tại sao phải khởi nghiệp', 'tại_sao phải khởi_nghiệp', NULL),
(966, 1, 'vì sao chúng ta nên khởi nghiệp', 'vì_sao chúng_ta nên khởi_nghiệp', NULL),
(967, 1, 'thuế là gì', 'thuế là gì', NULL),
(968, 1, 'thuế tncn là gì', 'thuế tncn là gì', NULL),
(969, 1, 'tại sao khởi nghiệp phải thành lập doanh nghiệp', 'tại_sao khởi_nghiệp phải thành_lập doanh_nghiệp', NULL),
(970, 1, 'cần bao nhiêu tiền để khởi nghiệp', 'cần bao_nhiêu tiền để khởi_nghiệp', NULL),
(971, 1, 'clear', 'clear', NULL),
(972, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(973, 1, 'startup là igf', 'startup là igf', NULL),
(974, 1, 'startup là gì', 'startup là gì', NULL),
(975, 1, 'khởi nghiệp là gì', 'khởi_nghiệp là gì', NULL),
(976, 1, 'startup là gì', 'startup là gì', NULL),
(977, 1, 'tại sao nên khởi nghiệp', 'tại_sao nên khởi_nghiệp', NULL),
(978, 1, 'vì sao chúng ta nên khởi nghiệp', 'vì_sao chúng_ta nên khởi_nghiệp', NULL),
(979, 1, 'tại sao kinh doanh phải thành lập doanh nghiệp', 'tại_sao kinh_doanh phải thành_lập doanh_nghiệp', NULL),
(980, 1, 'thuế là gì', 'thuế là gì', NULL),
(981, 1, 'thuế tncn là gì', 'thuế tncn là gì', NULL),
(982, 1, 'tại sao phải nộp thuế thu nhập cá nhân', 'tại_sao phải nộp thuế thu_nhập cá_nhân', NULL),
(983, 1, 'vì sao mọi người phải nộp thuế tncn', 'vì_sao mọi người phải nộp thuế tncn', NULL),
(984, 1, 'tôi muốn khởi nghiệp nhưng không biết bắt đầu từ đâu', 'tôi muốn khởi_nghiệp nhưng không biết bắt_đầu từ đâu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `seed`
--

CREATE TABLE `seed` (
  `id` int(11) NOT NULL,
  `word` varchar(255) NOT NULL,
  `sample` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seed`
--

INSERT INTO `seed` (`id`, `word`, `sample`) VALUES
(1, 'start_up', 'khởi_nghiệp'),
(2, 'startup', 'khởi_nghiệp'),
(3, 'vốn', 'tiền'),
(4, 'money', 'tiền'),
(5, 'xèng', 'tiền'),
(6, 'lý_do', 'lí_do'),
(7, 'tại_sao', 'lí_do'),
(8, 'vì_sao', 'lí_do'),
(9, 'yếu_tố', 'phẩm_chất'),
(10, 'tính_cách', 'phẩm chất'),
(11, 'cốt_cách', 'phẩm_chất'),
(12, 'các_bước', 'quá_trình'),
(13, 'bước', 'quá_trình'),
(14, 'mục_đích', 'mục_tiêu'),
(15, 'tiêu_chí', 'mục_tiêu'),
(16, 'nguyên_nhân', 'lí_do'),
(17, 'nghĩa', 'định_nghĩa'),
(18, 'khái_niệm', 'định_nghĩa'),
(19, 'tố_chất', 'phẩm_chất'),
(20, 'ai', 'người'),
(21, 'đối_tượng', 'người'),
(22, 'TNCN', 'thu_nhập cá_nhân'),
(23, 'tncn', 'thu_nhập cá_nhân'),
(24, 'mục_đích', 'mục_tiêu'),
(25, 'cách', 'quá_trình'),
(26, 'cách_thức', 'quá_trình'),
(27, 'có_nên', 'lí_do'),
(28, 'nguyên_nhân', 'lí_do'),
(29, 'có_nên', 'lí_do'),
(30, 'ngành_nghề', 'lĩnh_vực'),
(31, 'ngành', 'lĩnh_vực'),
(32, 'nghề', 'lĩnh_vực'),
(33, 'start-up', 'khởi_nghiệp');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `name_tag` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `name_tag`, `slug`, `created_at`, `updated_at`) VALUES
(2, 'khởi nghiệp', 'khoi-nghiep', '2020-02-16 20:29:20', '2020-02-16 20:29:20'),
(3, 'đồ uống', 'do-uong', '2020-02-16 20:33:56', '2020-02-16 20:33:56'),
(4, 'thuế', 'thue', '2020-02-17 18:53:55', '2020-02-17 18:53:55'),
(5, 'luật sư', 'luat-su', '2020-02-17 18:54:30', '2020-02-17 18:54:30'),
(6, 'nhà đầu tư', 'nha-dau-tu', '2020-02-17 18:55:08', '2020-02-17 18:55:08'),
(7, 'tiền', 'tien', '2020-02-17 18:55:43', '2020-02-17 18:55:43'),
(8, 'kinh doanh', 'kinh-doanh', '2020-02-17 18:56:08', '2020-02-17 18:56:08'),
(9, 'doanh nghiệp', 'doanh-nghiep', '2020-02-19 18:35:27', '2020-02-19 18:35:27');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `class` varchar(255) NOT NULL,
  `question` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `class`, `question`) VALUES
(1, 'DESC:def', 'khởi_nghiệp nghĩa_là gì'),
(2, 'DESC:reason', 'tại_sao nên khởi_nghiệp'),
(3, 'DESC:manner', 'quá_trình để thực_hiện khởi_nghiệp'),
(4, 'DESC:manner', 'nên khởi_nghiệp từ đâu');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `avatar`, `username`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, 'trần viết trưởng', 'tranviettruong1998@gmail.com', 'https://cdn.discordapp.com/avatars/235088799074484224/16c197c4c3f0eb808f9bceb6e1075e71.png?size=256', 'truong', '$2y$10$TkC5u3/Jl3SNcj333EFoduTSZJnUOvagpQtiw1ITPv97kZRKdCHWu', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Phan Trọng Tấn', 'tan@gmail.com', NULL, 'tan', '$2y$10$/lfPqAaPiUpdDvgrS7V5ueVFp.w.pmuScJpfrNb8vVfFFKx8ZJMMy', 1, '2020-02-17 23:02:10', '2020-02-17 23:02:10');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `vote_answer`
--

CREATE TABLE `vote_answer` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_answer` int(11) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vote_answer`
--

INSERT INTO `vote_answer` (`id`, `id_user`, `id_answer`, `type`) VALUES
(21, 1, 6, 0),
(27, 1, 7, 1),
(25, 1, 8, 0),
(28, 1, 14, 1),
(31, 1, 16, 1);

--
-- Triggers `vote_answer`
--
DELIMITER $$
CREATE TRIGGER `giam_dislike_answer` BEFORE DELETE ON `vote_answer` FOR EACH ROW UPDATE answer SET answer.num_dislike = answer.num_dislike - 1 WHERE answer.id = OLD.id_answer AND OLD.type = 0
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `giam_like_answer` AFTER DELETE ON `vote_answer` FOR EACH ROW UPDATE answer SET answer.num_like = answer.num_like - 1 WHERE answer.id = OLD.id_answer AND OLD.type = 1
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tang_dislike_answer` AFTER INSERT ON `vote_answer` FOR EACH ROW UPDATE answer SET answer.num_dislike = answer.num_dislike + 1 WHERE answer.id = NEW.id_answer AND NEW.type = 0
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tang_like_answer` AFTER INSERT ON `vote_answer` FOR EACH ROW UPDATE answer SET answer.num_like = answer.num_like + 1 WHERE answer.id = NEW.id_answer AND NEW.type = 1
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `vote_question`
--

CREATE TABLE `vote_question` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_question` int(11) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vote_question`
--

INSERT INTO `vote_question` (`id`, `id_user`, `id_question`, `type`) VALUES
(134, 1, 4, 0),
(170, 1, 6, 1),
(175, 1, 21, 1),
(181, 1, 25, 1),
(184, 1, 26, 1),
(151, 4, 6, 1),
(157, 4, 9, 1);

--
-- Triggers `vote_question`
--
DELIMITER $$
CREATE TRIGGER `giam_dislike_question` AFTER DELETE ON `vote_question` FOR EACH ROW UPDATE question SET question.num_dislike = question.num_dislike - 1 WHERE question.id = OLD.id_question AND OLD.type = 0
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `giam_like_question` AFTER DELETE ON `vote_question` FOR EACH ROW UPDATE question SET question.num_like = question.num_like - 1 WHERE question.id = OLD.id_question AND OLD.type = 1
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tang_dislike_question` AFTER INSERT ON `vote_question` FOR EACH ROW UPDATE question SET question.num_dislike = question.num_dislike + 1 WHERE question.id = NEW.id_question AND NEW.type = 0
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tang_like_question` AFTER INSERT ON `vote_question` FOR EACH ROW UPDATE question SET question.num_like = question.num_like + 1 WHERE question.id = NEW.id_question AND NEW.type = 1
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dataset_answer`
--
ALTER TABLE `dataset_answer`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `dataset_answer` ADD FULLTEXT KEY `text` (`text`);

--
-- Indexes for table `dataset_question`
--
ALTER TABLE `dataset_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_user` (`id_user`,`id_question`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `news` ADD FULLTEXT KEY `title` (`title`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);
ALTER TABLE `question` ADD FULLTEXT KEY `content` (`content`);

--
-- Indexes for table `question_user`
--
ALTER TABLE `question_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seed`
--
ALTER TABLE `seed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vote_answer`
--
ALTER TABLE `vote_answer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_user` (`id_user`,`id_answer`,`type`);

--
-- Indexes for table `vote_question`
--
ALTER TABLE `vote_question`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_user` (`id_user`,`id_question`,`type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `dataset_answer`
--
ALTER TABLE `dataset_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `dataset_question`
--
ALTER TABLE `dataset_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=508;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `question_user`
--
ALTER TABLE `question_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=985;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seed`
--
ALTER TABLE `seed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vote_answer`
--
ALTER TABLE `vote_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `vote_question`
--
ALTER TABLE `vote_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
