###############################
# Origin Access Control (OAC)
###############################

resource "aws_cloudfront_origin_access_control" "frontend_oac" {
  name                              = "starttech-oac"
  description                       = "OAC for StartTech frontend bucket"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

###############################
# CloudFront Distribution
###############################

resource "aws_cloudfront_distribution" "starttech" {

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "StartTech CloudFront Distribution"
  default_root_object = "index.html"

  #########################################################
  # Origin 1 - S3 Frontend
  #########################################################

  origin {

    domain_name = var.bucket_domain
    origin_id   = "S3-Frontend"

    origin_access_control_id = aws_cloudfront_origin_access_control.frontend_oac.id
  }

  #########################################################
  # Origin 2 - ALB Backend
  #########################################################

  origin {

    domain_name = var.alb_dns_name
    origin_id   = "ALB-Backend"

    custom_origin_config {

      http_port  = 80
      https_port = 443

      origin_protocol_policy = "http-only"

      origin_ssl_protocols = [
        "TLSv1.2"
      ]
    }
  }

  #########################################################
  # Default Behaviour
  #########################################################

  default_cache_behavior {

    target_origin_id = "S3-Frontend"

    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = [
      "GET",
      "HEAD"
    ]

    cached_methods = [
      "GET",
      "HEAD"
    ]

    compress = true

    forwarded_values {

      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  #########################################################
  # API Behaviour
  #########################################################

  ordered_cache_behavior {

    path_pattern = "/api/*"

    target_origin_id = "ALB-Backend"

    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = [
      "GET",
      "HEAD",
      "OPTIONS",
      "PUT",
      "POST",
      "PATCH",
      "DELETE"
    ]

    cached_methods = [
      "GET",
      "HEAD"
    ]

    compress = true

    forwarded_values {

      query_string = true

      headers = [
        "*"
      ]

      cookies {
        forward = "all"
      }
    }

    min_ttl     = 0
    default_ttl = 0
    max_ttl     = 0
  }

  #########################################################
  # SPA Routing
  #########################################################

  custom_error_response {

    error_code            = 403
    response_page_path    = "/index.html"
    response_code         = 200
    error_caching_min_ttl = 0
  }

  custom_error_response {

    error_code            = 404
    response_page_path    = "/index.html"
    response_code         = 200
    error_caching_min_ttl = 0
  }

  restrictions {

    geo_restriction {

      restriction_type = "none"
    }
  }

  viewer_certificate {

    cloudfront_default_certificate = true
  }

  tags = var.tags
}
