

#select Country
  #check that Country list is present
  #check that 'Australila' is present in the list
  #check that 'Australila' is selected

#select State
  #check that City list is present
  wd.div(:text, 'City').click
  #check that 'Qld' is present in the list
  wd.div(:text, 'Qld').click
  #check that 'Qld' is selected

#select City
  #check that Area list is present
  wd.div(:text, 'Area').click
  #check that 'Ahuriri' is present in the list
  wd.div(:text, 'Ahuriri').click
  #check that 'Ahuriri' is selected

#select Site
  #check that Site list is present
  wd.div(:text, 'Add Site').click
  #check that 'Bunnings' is present in the list
  wd.div(:text, 'Bunnings').click
  #check that 'Bunnings' is selected

#Define date range
  #check that date controls are present

  #Show Day view
    #select Day option
    #check that Day view is displayed

  #Show Week view

  #Show Month view

  #Show 1 day view by Calendar

  #Show 5 days view by Calendar

  #Show 13 days view by Calendar

#Work with shift
  #check that add shift option is present


  it "Add simple shift" do

  end

  it "Add split shift" do

  end

  it "Delete shift" do

  end

  it "Edit shift" do

  end

  context "copy shift" do

    it "for 1 day" do

    end

    it "for 3 days" do

    end

    it "for 8 days" do

    end

    it "for 31 days" do

    end

  end

  context "Send Offers" do

    it "Send Offers" do

    end

    it "Update Send Offers" do

    end

  end
  end

  end
