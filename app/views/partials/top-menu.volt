<div id="header" class="container-fluid">
    <div class="row">
        <div class="navbar-container">
            <div class="container">
                <div class="row">
                    <div class="col-lg-1 col-sm-2 col-xs-2">
                        <a class="navbar-brand" href="/discussions"><img src="/images/logo.png" alt="Project name" class="logo" /></a>
                    </div>
                    <div class="col-lg-3 col-sm-10 col-xs-10">
                        <ul class="list-inline menu">
                            <li><a class="active" href="/blog" target="_blank">{{ t('Blog') }}</a></li>
                            <li><a href="/">{{ t('Video') }}</a></li>

                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle categories-link" data-toggle="dropdown" id="dropdownCategories" role="button" aria-haspopup="true" aria-expanded="false" title="Categories">
                                    {{t('Category')}}<span class="octicon octicon-list-unordered"></span> <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu categories-dropdown" aria-labelledby="dropdownCategories">
                                    {%- if categories is defined -%}
                                            {%- for category in categories -%}
                                            <li>
                                                {{-
                                                    link_to('category/' ~ category.id ~ '/' ~ category.slug,
                                                        '<span class="label label-default pull-right">' ~ category.number_posts ~ '</span>' ~ category.name)
                                                -}}
                                            </li>
                                            {%- endfor -%}
                                        {%- endif -%}

                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="visible-xs visible-sm clearfix"></div>
                    <div class="col-lg-6 col-sm-8 col-xs-12">
                        <form action="/search" method="GET">
                            <div class="topsearch">
                                <div class="input-group">
                                    <span class="input-group-addon" id="sizing-addon2"><i class="fa fa-search"></i></span>
                                    <input type="text" class="form-control" placeholder="{{t('Search')}}" aria-describedby="sizing-addon2" name="q">
                                    <div class="input-group-btn">
                                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-video-camera" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;
                                        <span class="caret"></span></button>/
                                        <ul class="dropdown-menu">
                                            <li><a href="#"><i class="cv cvicon-cv-relevant"></i> Relevant</a></li>
                                            <li><a href="#"><i class="cv cvicon-cv-calender"></i> Recent</a></li>
                                            <li><a href="#"><i class="cv cvicon-cv-view-stats"></i> Viewed</a></li>
                                            <li><a href="#"><i class="cv cvicon-cv-star"></i> Top Rated</a></li>
                                            <li><a href="#"><i class="cv cvicon-cv-watch-later"></i> Longest</a></li>
                                        </ul>
                                    </div><!-- /btn-group -->
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="visible-xs clearfix"></div>
                    {% set user = this.auth.getUser() %}

                        {% if user == true %}
                        <div class="col-lg-2 col-sm-4  col-xs-8">
                        <div class="avatar pull-left">
                            <img src="{{ user.getAvatar() }}" alt="avatar" class="avatar-user"/>
                            <span class="status"></span>
                        </div>
                        <div class="selectuser pull-left">
                            <div class="btn-group pull-right dropdown">
                                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">{{ user.getFullname() }}<span class="caret"></span></button>
                                <ul class="dropdown-menu">
                                    <li><a href="/post/discussion">{{ t('Start a Discussion') }}</a></li>
                                    <li><a href="/users/profile">{{ t('Edit Profile') }}</a></li>
                                    <li><a href="/users/avatar">{{ t('Edit avatar') }}</a></li>
                                    <li><a href="/users/changepassword">{{ t('Change password') }}</a></li>
                                    <li><a href="/logout">{{ t('Logout') }}</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    {% else %}
                        <div class="col-lg-2 col-sm-4  col-xs-8">
                            <div class="avatar sub-header pull-left">
                                <img src="/images/avatar.png" alt="avatar" />
                                <span class="status"></span>
                            </div>
                            <div class="selectuser pull-left">
                                <div class="btn-group pull-right dropdown">
                                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">{{ t('Hello') }}<span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a href="/login?redirect={{redirect}}">{{ t('Login') }}</a></li>
                                        <li><a href="/signup">{{ t('Sign up') }}</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>

                    {% endif %}
                </div>
            </div>
        </div>
    </div>
</div>
