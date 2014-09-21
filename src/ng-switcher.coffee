'use strict'

angular.module('theaquaNg', ['ng']).
  directive('ngSwitcher', () ->
    require: 'ngModel'
    restrict: 'AE'
    scope: {}
    template: """<div class="switch" ng-class="{\'switch-left\': !model, \'switch-right\': model}" ng-click="toggle()">
                  <div class="switch-button">&nbsp;</div>
                </div>"""
    link: (scope, element, attrs, ngModel) ->
      updateModel = () ->
        scope.model = ngModel.$viewValue

      scope.toggle = () ->
        ngModel.$setViewValue(!ngModel.$viewValue)
        updateModel()

      ngModel.$render = () ->
        updateModel()
  )
