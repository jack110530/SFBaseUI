#
# Be sure to run `pod lib lint SFBaseUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SFBaseUI'
  s.version          = '0.1.1'
  s.summary          = 'SFBaseUI 基础库 UI层'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/jack110530/SFBaseUI'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jack110530' => 'hsf_ios@sina.com' }
  s.source           = { :git => 'https://github.com/jack110530/SFBaseUI.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'SFBaseUI/Classes/SFBaseUI.h'
  s.public_header_files = 'SFBaseUI/Classes/SFBaseUI.h'

  # SFMakerKit
  s.subspec 'SFMakerKit' do |ss|

    ss.source_files = 'SFBaseUI/Classes/SFMakerKit/SFMakerKit.h'
    ss.public_header_files = 'SFBaseUI/Classes/SFMakerKit/SFMakerKit.h'

    # SFMaker
    ss.subspec 'SFMaker' do |sss|
      sss.source_files = 'SFBaseUI/Classes/SFMakerKit/SFMaker/*.{h,m}'
    end

    # SFButton
    ss.subspec 'SFButton' do |sss|
      sss.source_files = 'SFBaseUI/Classes/SFMakerKit/SFButton/*.{h,m}'
      sss.dependency 'SFBaseUI/SFMakerKit/SFMaker'
      sss.dependency 'SFBaseUI/SFMakerKit/SFObject'
    end

    # SFLabel
    ss.subspec 'SFLabel' do |sss|
      sss.source_files = 'SFBaseUI/Classes/SFMakerKit/SFLabel/*.{h,m}'
      sss.dependency 'SFBaseUI/SFMakerKit/SFMaker'
    end

    # SFObject
    ss.subspec 'SFObject' do |sss|
      sss.source_files = 'SFBaseUI/Classes/SFMakerKit/SFObject/*.{h,m}'
      sss.dependency 'SFBaseUI/SFMakerKit/SFMaker'
    end

    # SFView
    ss.subspec 'SFView' do |sss|
      sss.source_files = 'SFBaseUI/Classes/SFMakerKit/SFView/*.{h,m}'
      sss.dependency 'SFBaseUI/SFMakerKit/SFMaker'
    end

  end


  # SFUIKit
  s.subspec 'SFUIKit' do |ss|

    ss.source_files = 'SFBaseUI/Classes/SFUIKit/SFUIKit.h'
    ss.public_header_files = 'SFBaseUI/Classes/SFUIKit/SFUIKit.h'
    
    # SFProtocol
    ss.subspec 'SFProtocol' do |sss|
      sss.source_files = 'SFBaseUI/Classes/SFUIKit/SFProtocol/*.{h,m}'
    end
    
    # SFView
    ss.subspec 'SFView' do |sss|
      sss.source_files = 'SFBaseUI/Classes/SFUIKit/SFView/*.{h,m}'
      sss.dependency 'SFBaseUI/SFUIKit/SFProtocol'
    end
    
    # SFButton
    ss.subspec 'SFButton' do |sss|
      sss.source_files = 'SFBaseUI/Classes/SFUIKit/SFButton/*.{h,m}'
    end
    
    # SFViewController
    ss.subspec 'SFViewController' do |sss|
      sss.source_files = 'SFBaseUI/Classes/SFUIKit/SFViewController/*.{h,m}'
      sss.dependency 'SFBaseUI/SFUIKit/SFProtocol'
    end
    
    # SFScroll
    ss.subspec 'SFScroll' do |sss|
      sss.source_files = 'SFBaseUI/Classes/SFUIKit/SFScroll/*.{h,m}'
      sss.dependency 'SFBaseUI/SFUIKit/SFViewController'
    end
    
    # SFTable
    ss.subspec 'SFTable' do |sss|
      sss.source_files = 'SFBaseUI/Classes/SFUIKit/SFTable/*.{h,m}'
      sss.dependency 'SFBaseUI/SFUIKit/SFProtocol'
      sss.dependency 'SFBaseUI/SFUIKit/SFViewController'
    end
    
    # SFCollection
    ss.subspec 'SFCollection' do |sss|
      sss.source_files = 'SFBaseUI/Classes/SFUIKit/SFCollection/*.{h,m}'
      sss.dependency 'SFBaseUI/SFUIKit/SFProtocol'
      sss.dependency 'SFBaseUI/SFUIKit/SFViewController'
    end
    
    # SFCountdown
    ss.subspec 'SFCountdown' do |sss|
      sss.source_files = 'SFBaseUI/Classes/SFUIKit/SFCountdown/*.{h,m}'
    end
    
    # SFProgress
    ss.subspec 'SFProgress' do |sss|
      sss.source_files = 'SFBaseUI/Classes/SFUIKit/SFProgress/*.{h,m}'
      sss.dependency 'SFBaseUI/SFUIKit/SFView'
    end

  end
  
  
#  # SFDesignPattern
#  s.subspec 'SFDesignPattern' do |ss|

#    ss.source_files = 'SFBaseUI/Classes/SFDesignPattern/SFDesignPattern.h'
#    ss.public_header_files = 'SFBaseUI/Classes/SFDesignPattern/SFDesignPattern.h'
   
#    # SFMvc
#    ss.subspec 'SFMvc' do |sss|
#      sss.source_files = 'SFBaseUI/Classes/SFDesignPattern/SFMvc/SFMvc.h'
#      sss.public_header_files = 'SFBaseUI/Classes/SFDesignPattern/SFMvc/SFMvc.h'
     
#      # SFTableMvc
#      sss.subspec 'SFTableMvc' do |ssss|
#        ssss.source_files = 'SFBaseUI/Classes/SFDesignPattern/SFMvc/SFTableMvc/*.{h,m}'
#      end
     
#    end

#    # SFMvvm
#    ss.subspec 'SFMvvm' do |sss|
#      sss.source_files = 'SFBaseUI/Classes/SFDesignPattern/SFMvvm/SFMvvm.h'
#      sss.public_header_files = 'SFBaseUI/Classes/SFDesignPattern/SFMvvm/SFMvvm.h'
     
#      # SFMvvmProtocol
#      sss.subspec 'SFMvvmProtocol' do |ssss|
#        ssss.source_files = 'SFBaseUI/Classes/SFDesignPattern/SFMvvm/SFMvvmProtocol/*.{h,m}'
#      end
     
#      # SFViewModel
#      sss.subspec 'SFViewModel' do |ssss|
#        ssss.source_files = 'SFBaseUI/Classes/SFDesignPattern/SFMvvm/SFViewModel/*.{h,m}'
#      end
     
#      # SFTableMvvm
#      sss.subspec 'SFTableMvvm' do |ssss|
#        ssss.source_files = 'SFBaseUI/Classes/SFDesignPattern/SFMvvm/SFTableMvvm/*.{h,m}'
#      end
     
#    end

#  end

#  # SFModel
#  s.subspec 'SFModel' do |ss|

#    ss.source_files = 'SFBaseUI/Classes/SFModel/SFModel.h'
#    ss.public_header_files = 'SFBaseUI/Classes/SFModel/SFModel.h'
   
#    # SFModelProtocol
#    ss.subspec 'SFModelProtocol' do |sss|
#        sss.source_files = 'SFBaseUI/Classes/SFModel/SFModelProtocol/*.{h,m}'
#    end
   
#    # SFTableModel
#    ss.subspec 'SFTableModel' do |sss|
#        sss.source_files = 'SFBaseUI/Classes/SFModel/SFTableModel/*.{h,m}'
#    end

#  end

  
  # s.resource_bundles = {
  #     'SFBaseUI' => ['SFBaseUI/Assets/*']
  # }

  s.frameworks = 'UIKit', 'Foundation'
  
  
  s.dependency 'Masonry'
  s.dependency 'SFCategory'
  s.dependency 'SFMacro'
  s.dependency 'SFCrashInspector'
  # s.dependency 'ReactiveObjC'
  # s.dependency 'MJRefresh'
  # s.dependency 'YYModel'
  
  
  
end
